package daffron.fms.hr.recruiting
import daffron.fms.hr.User
import daffron.fms.hr.payroll.EmployeePayrollMaster;
import grails.test.*
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH
import grails.test.mixin.*
import grails.plugin.mail.MailService
import daffron.fms.hr.MsMailService

@TestFor(StatusService)
@Mock([Candidate, JobClassDescription, JobDescription, 
		Requisition, RequisitionStatus, RequisitionCandidate, 
		EmployeePayrollMaster, User, Approve, Interviewer,
	   Behavior, BehaviorResult
	   ])
class StatusTests {
	def statusService
	def mockMailService
	def mockMsMailService
	void setUp() {
        mockMailService = mockFor(MailService.class)
        mockMsMailService = mockFor(MsMailService.class)
		// set soft-coded schema name
		CH.config = new groovy.util.ConfigObject()
		CH.config.putAt 'hr.schema', 'hrpixpgle' 

		[ 'NEW', 'PRESCREEN', 'PHONEINTV', 'APPROVE', 'JOBDMOD', 'PREPOSTING', 'IPOSTED', 'XPOSTED', 'HRSELECT', 'SUPERSELECT', 
			'DRUG', 'OFFER',
		 'PRECONTACT', 'SCHTEST', 'TESTING', 'PICK', 'SINTD', 'INTERVIEW', 'BCKGRDCHK', 'OFFERDRUG', 'SUPERSIGNHIRE', 'NEWHIRE' ].each { 
			def rs = new RequisitionStatus(desc:it, nextPageHr:'', nextPageSuper:'')
			rs.id = it
			rs.save(validate:false)	
		}
		
		def jcd = new JobClassDescription(title:'prod job')
		jcd.id = 'bluecollar'
		assert jcd.save(validate:false)
		jcd = new JobClassDescription(title:'hr')
		jcd.id = 'hr'
		jcd.save(validate:false)
		jcd = new JobClassDescription(title:'cfo')
		jcd.id = 'cfo'
		jcd.save(validate:false)
		jcd = new JobClassDescription(title:'super')
		jcd.id = 'super'
		jcd.save(validate:false)
		jcd = new JobClassDescription(title:'general manager')
		jcd.id = 'gm'
		jcd.save(validate:false)
		
		assert 5 == JobClassDescription.count()
		
		def prodJob = new JobDescription(job:'prod job', jobClass: jcd)
		prodJob.save(validate:false)
		def copyJob = new JobDescription(job:'copy job', prodJobD:prodJob, jobClass:jcd) 
		copyJob.save(validate:false)
		assert 2 == JobDescription.count()
		def copyJobDup = new JobDescription(job:'copy job', prodJobD:prodJob, jobClass:jcd) 
		// be sure duplicate jobd mod is ignored
		assert !copyJobDup.save() // check validator for uniqueness of prodJobD
		assert copyJobDup.errors.hasFieldErrors('prodJobD')
		assert 2 == JobDescription.count()
				
		def emp = new EmployeePayrollMaster(name:'cfo', jobClass:JobClassDescription.get('cfo').id)
		emp.id = 1
		emp.save(validate:false)
		emp = new EmployeePayrollMaster(name:'gm', jobClass:JobClassDescription.get('gm').id)
		emp.id = 2
		emp.save(validate:false)
		emp = new EmployeePayrollMaster(name:'super', jobClass:JobClassDescription.get('super').id, supervisorEmpNo:5)
		emp.id = 3
		emp.save(validate:false)
		emp = new EmployeePayrollMaster(name:'hr', jobClass:JobClassDescription.get('hr').id)
		emp.id = 4
		emp.save(validate:false)
		emp = new EmployeePayrollMaster(name:'superssuper', jobClass:JobClassDescription.get('super').id)
		emp.id = 5
		emp.save(validate:false)
		assert 5 == EmployeePayrollMaster.count()
		assert 2 == EmployeePayrollMaster.where{name =='gm'}.find()?.id
		
		User user = new User(hrSecurityLevel:9, employeeNo: 4)
		user.id = 'hr'
		user.save(validate:false)
		user = new User(hrSecurityLevel:1, employeeNo: 3)
		user.id = 'super'
		user.save(validate:false)
		user = new User(hrSecurityLevel:1, employeeNo: 2)
		user.id = 'gm'
		user.save(validate:false)
		user = new User(hrSecurityLevel:1, employeeNo: 1)
		user.id = 'cfo'
		user.save(validate:false)
		assert 4 == User.count()
	
		new Approve(jobClass:JobClassDescription.get('gm')).save(validate:false)
		new Approve(jobClass:JobClassDescription.get('cfo')).save(validate:false)
		assert 2 == Approve.count()
		
		assert new Behavior(name:'odd').save()

	}
	void testDaffron() {
		statusService = new StatusService()
        mockMailService.demand.sendMail() { def closure -> return null }
        mockMsMailService.demand.sendAuthenticatedMail(1..3) { def closure -> return null }
        statusService.mailService = mockMailService.createMock()
        statusService.msMailService = mockMsMailService.createMock()
		CH.config.putAt 'hr.props.loc', './test/unit/' 
		statusService.loadStatusRules()
		
		assert RequisitionStatus.get('NEW')
		def req = new Requisition()
		req.status = RequisitionStatus.get('NEW') // named params stopped working in Requisition only for some reason????
		req.supervisor = EmployeePayrollMaster.get(3)
		req.save(validate:false)
		assert RequisitionStatus.get('NEW') == req.status
		statusService.activity(req)
		
		assert RequisitionStatus.get('PREPOSTING') == req.status
		req.internalPosted = new Date()
		statusService.activity(req)
		assert RequisitionStatus.get('IPOSTED') == req.status
		req.externalPosted = new Date()
		statusService.activity(req)
		assert RequisitionStatus.get('XPOSTED') == req.status
        def candidate = new Candidate(name:'Smith, One', requisition:req)
		candidate.save(validate:false)
		def reqCandi = new RequisitionCandidate(requisition:req, candidate:candidate, rank:99).save(validate:false)
		req.addToCandidates(reqCandi)
		req.hrFiltered = new Date()
		req.save()
		statusService.activity(req)
		assert RequisitionStatus.get('HRSELECT') == req.status
		req.hrFiltered = new Date()
		assert req.hrFiltered != null
		statusService.activity(req)
		assert RequisitionStatus.get('PRESCREEN') == req.status
		req.candidates.each { it.emailQuizReply = 'candidate response'}
		statusService.activity(req)
		assert RequisitionStatus.get('PHONEINTV') == req.status
		statusService.activity(req)
		assert RequisitionStatus.get('PHONEINTV') == req.status
		req.candidates.each { it.phoneInterview = new Date()}
		statusService.activity(req)
		assert RequisitionStatus.get('SUPERSELECT') == req.status
		req.superFiltered = new Date()
		statusService.activity(req)
		assert RequisitionStatus.get('SINTD') == req.status
		
		def interviewer = new Interviewer(emp:EmployeePayrollMaster.where{name =='gm'}.find())
		assert interviewer
		req.addToInterviewTeam interviewer
		req.save(validate:false)
		statusService.activity(req)
		req.candidates.each {rc ->
			rc.rank = 1
			rc.interview = new Date()
		}
		statusService.activity(req)
		assert RequisitionStatus.get('INTERVIEW') == req.status
		req.candidates.each { it.backgroundCheckInitiated = new Date() }
		statusService.activity(req)
		
		assert RequisitionStatus.get('PRECONTACT') == req.status
		req.candidates.each{rc ->
			rc.contactedForTest = new Date()
		}
		
		def br = new BehaviorResult(behavior:Behavior.list()[0], result:1, note:'none')
		candidate.addToBehaviors br
		candidate.save(validate:false)
		br.save()
		statusService.activity(req)
		assert RequisitionStatus.get('TESTING') == req.status
		
//		assert req.allTestScoresIn == true
		statusService.activity(req)
		assert RequisitionStatus.get('PICK') == req.status
		
		statusService.activity(req)
		assert RequisitionStatus.get('BCKGRDCHK') == req.status
		req.candidates.each { it.backgroundCheckComplete = new Date() }
		
		statusService.activity(req)
		assert RequisitionStatus.get('DRUG') == req.status
		
		statusService.activity(req)
		assert req.statusRulesError ==~ /.*DRUG.*not.*completed.*/
		
		req.candidates.each {rc ->
			rc.drugTestComplete = new Date()
		}
		
		assert req.allDrugTestsComplete == true
		statusService.activity(req)
		assert RequisitionStatus.get('OFFER') == req.status
		
		statusService.activity(req)
		assert req.statusRulesError ==~ /.*OFFER.*no candidate.*accepted.*/
		
		req.candidates.each {rc ->
			rc.offerAccepted = true
		}
		statusService.activity(req)
		assert RequisitionStatus.get('SUPERSIGNHIRE') == req.status
		
		req.approvedForHire = new Date()
		statusService.activity(req)
		assert RequisitionStatus.get('NEWHIRE') == req.status
	}
	void testGLE() {
		statusService = new StatusService()
        mockMailService.demand.sendMail() { def closure -> return null }
        mockMailService.demand.sendAuthenticatedMail() { def closure -> return null }
        statusService.mailService = mockMailService.createMock()
        statusService.msMailService = mockMailService.createMock()
		CH.config.putAt 'hr.props.loc', './src/groovy/' 
		statusService.loadStatusRules()
		def prodJob = JobDescription.where {job == 'prod job'}.find()
		assert prodJob?.job == 'prod job'
		
		def req = new Requisition()
		req.status = RequisitionStatus.get('NEW')
		req.jobD = prodJob 
		req.supervisor = EmployeePayrollMaster.get(3)
		req.save(validate:false)
		assert RequisitionStatus.get('NEW') == req.status
		assert req.status.id == 'NEW'
		statusService.activity(req)
		assert RequisitionStatus.get('APPROVE') == req.status 
		statusService.activity(req)
		// still should be approve as the approvers haven't approved it yet...
		assert  RequisitionStatus.get('APPROVE') == req.status  
	
		// only 1 approved, need 2 plus super's super
		//req.addToApprovedBy(EmployeePayrollMaster.get(2))  
		req.approvedBy = [EmployeePayrollMaster.get(2)] // addTo will not work in unit tests
		statusService.activity(req)
		assert  RequisitionStatus.get('APPROVE') == req.status  
		
		// still  need super's super
		//req.addToApprovedBy(EmployeePayrollMaster.get(1))//.findByName('cfo'))
		req.approvedBy = [EmployeePayrollMaster.get(2), EmployeePayrollMaster.get(1)] // addTo will not work in unit tests
		statusService.activity(req)
		assert  RequisitionStatus.get('APPROVE') == req.status  
		
		// add super's super and should now go to JOBDMOD
		//req.addToApprovedBy(EmployeePayrollMaster.get(5))//.findByName('superssuper'))
		req.approvedBy = [EmployeePayrollMaster.get(5), EmployeePayrollMaster.get(2), EmployeePayrollMaster.get(1)] // addTo will not work in unit tests
		statusService.activity(req)
		assert  RequisitionStatus.get('JOBDMOD') == req.status  
		
		def copyJob = JobDescription.where {prodJobD ==  prodJob}.find()
		assert copyJob?.job == 'copy job'
		copyJob.delete(flush:true)
		assert null == JobDescription.where {prodJobD == JobDescription.where {job == 'prod job'}.find()}.find()
		
		statusService.activity(req)
		assert  RequisitionStatus.get('PREPOSTING') == req.status 
		statusService.activity(req)
		// should stay at preposting till date is set
		assert  RequisitionStatus.get('PREPOSTING') == req.status 
		req.internalPosted = new Date()
		statusService.activity(req)
		assert  RequisitionStatus.get('IPOSTED') == req.status 
		req.externalPosted = new Date()
		statusService.activity(req)
		assert  RequisitionStatus.get('XPOSTED') == req.status 
		
        def candidate = new Candidate(name:'Smith, One', requisition:req)
		candidate.save(validate:false)
		def reqCandi = new RequisitionCandidate(requisition:req, candidate:candidate, rank:1).save(validate:false)
		req.addToCandidates(reqCandi)
		
		candidate.save(validate:false)
		statusService.activity(req)
		assert  RequisitionStatus.get('HRSELECT') == req.status 
	}
}
