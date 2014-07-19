package daffron.fms.hr.recruiting
 
import java.awt.Dimension;
import java.awt.image.BufferedImage;
import java.util.List;

import javax.imageio.ImageIO;

import daffron.fms.gl.Department;
import daffron.fms.hr.AuthorizeOperation
import daffron.fms.hr.PersonnelAction;

import daffron.fms.hr.payroll.EmployeePayrollMaster
import daffron.fms.hr.payroll.GeneralConstants;
import daffron.fms.hr.payroll.PrCodes;
import daffron.fms.hr.User
import grails.util.Environment
import grails.converters.JSON
import groovy.sql.Sql

import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH


import org.xhtmlrenderer.simple.Graphics2DRenderer
import org.xhtmlrenderer.util.DownscaleQuality;
import org.xhtmlrenderer.util.FSImageWriter;
import org.xhtmlrenderer.util.ImageUtil;
import org.xhtmlrenderer.util.ScalingOptions;

class RequisitionController {
    
    def statusService
    def pdfService
    def sessionFactory
    def msMailService
    def fileService
    def grailsApplication
    
    static allowedMethods = [save: "POST", update: "POST", // , delete: "POST"] temporarily to allow quick deletion...
                offerResponse:"POST", hoverMenuBuild:"POST", hoverMenu:"POST", assignCandiToReq:"POST", //supervisorNames:"POST",
                picked:"POST", empNames:"POST", empNoByName:"POST", superEmployees:"POST", addInterviewer:"POST"]
    
    def beforeInterceptor = {
        log.debug("action: $actionName params: $params flash: $flash")
    }

    def index = {
        redirect(action: "list", params: params)
    }

    static def HOVER_MENU_STATUS_ACTION_MAP = [
        NEW:['edit', 'pickInterviewTeam'],
        APPROVE:['show', 'pickInterviewTeam'],
        JOBDMOD:['edit', 'pickInterviewTeam'],
        PREPOSTING:['edit', 'internalPosting', 'pickInterviewTeam'],
        IPOSTED:['edit', 'externalPosting', 'pickInterviewTeam'],
        XPOSTED:['edit', 'pickInterviewTeam'],
        HRSELECT:['edit', 'pickInterviewTeam' ],
        SUPERSELECT:['edit', 'pickInterviewTeam' ],
        PRECONTACT:['edit', 'pickInterviewTeam'],
        TESTING:['edit', 'pickInterviewTeam'],
        PICK:['edit', 'pickInterviewTeam'],
        SINTD:['edit', 'pickInterviewTeam'],
        INTERVIEW:['edit'],
        BCKGRDCHK:['edit'],
        OFFERDRUG:['edit'],
        OFFER:['edit'],
        DRUG:['edit'],
        SUPERSIGNHIRE:['show', 'edit', 'personnelAction'],
        NEWHIRE:['edit'],
        PRESCREEN:['edit'],
        PHONEINTV:['edit']
        // SCHTEST:[''], not required
    ]
    static List authorizedActionPages(User user) {
        if (user.hrAdmin) {
            ['show', 'edit', 'internalPosting', 'externalPosting', 'pickInterviewTeam', 'personnelAction']
         } else {
             ['show', 'list', 'pickInterviewTeam', 'personnelAction']
        }
    }
    @AuthorizeOperation( level='1', text='Move to next status (unless state prevents)' )
    def next() {
        def req = Requisition.get(params.id)
        assert req
        RequisitionStatus changedStatus = statusService.activity(req)  
        if (changedStatus) {
            flash.message = "Requisition ${req.id} status changed to ${changedStatus.id}:${changedStatus.desc}"
        } else {
            flash.message = req.statusRulesError
        }
        redirect(action: "list")
    }
    @AuthorizeOperation( level='1', text='Personnel Action form: accept hire' )
    def personnelAction = {
        def req = Requisition.get(params.id)
        assert req
        def pa = PersonnelAction.findByRequisition(req)
        if (!pa) {
            def candidates = []
            req.candidates.findAll{(1..98).contains(it.rank)}.each {candidates << it.candidate}
            pa = new PersonnelAction(requisition:req, candidate:candidates[0], 'add.replacing':req.replacing, 
                                    'to.position':req.jobD.id, 'from.position':req.jobD.id, 'add.position':req.jobD.id)
            if(!pa.save()) {
                pa.errors.each{println it}
            }
        }
        boolean use_GL_Departments = GeneralConstants.findByConstantName('PR_UseGLDepartment')?.constantData?.trim() == 'Y'
        def deptList = use_GL_Departments?Department.list(['sort':'description']):PrCodes.findAllByField('EDPT', ['sort':'descOfValue'])
        boolean use_GL_Sub_Departments = GeneralConstants.findByConstantName('PR_UseGLSubDept')?.constantData?.trim() == 'Y'
        def subDeptList = use_GL_Sub_Departments?Department.list(['sort':'description']):PrCodes.findAllByField('EDPT', ['sort':'descOfValue'])
        [req:Requisition.get(params.id), pa:pa, 
           empList: EmployeePayrollMaster.list(['sort':'name']),
           userList: User.findAllByEmailLikeAndEmployeeNoGreaterThan('%@%', 0, ['sort':'fullName']),
           use_GL_Departments:use_GL_Departments, deptList:deptList, 
           use_GL_Sub_Departments:use_GL_Sub_Departments, subDeptList:subDeptList, 
           jobDescList:JobDescription.findAllByProdJobDIsNull(['sort':'jobClass.title'])
        ]
    }
    @AuthorizeOperation( level='1', text='Personnel Action form: update' )
    def personnelActionUpdate = {
        def pa = PersonnelAction.get(params.pafId)
        assert pa
        pa.properties = params
        if (pa.save(flush: true)) {
            flash.message = "${message(code: 'default.updated.message', args: [message(code: 'requisition.label', default: 'PersonnelAction'), pa.id])}"
            // TODO if more candidates, go to them.
            // req.candidates.findAll{(1..98).contains(it.rank)}.each {candidates << it.candidate}
            redirect(action: "list")
        } else {
            def req = Requisition.get(params.id)
            assert req
            render(view: "personnelAction", model: [req: req, pa:pa])
        }
    }
    def personnelActionEmail = {
        def req = Requisition.get(params.id)
        assert req
        def link = g.createLink(controller:'requisition', action:'personnelAction', id:params.id, absolute:true)
        def message = "To review the Personnel Action Form for requisition: ${req.id}:${req}, please go to ${link} and then set the Sign Date beside your name."
        User supervisor
        def toAddr = []
        if (params.supervisorId) {
            supervisor = User.findByEmployeeNo(params.supervisorId)
            toAddr << supervisor.email
        }
        User deptManager
        if (params.deptManagerId) {
            deptManager = User.findByEmployeeNo(params.deptManagerId)
            toAddr << deptManager.email
        }
        if (!supervisor && !deptManager) {
            render "Please select a supervisor or a department manager before clicking email"
            return
        } else {
        }
        User hr = User.findByEmployeeNo(params.hrId?:-1)
        if (!hr) {
            render "Please select an HR employee before clicking email"
            return
        }
        if (grailsApplication.config.grails.mail.user) { // microsoft authenticated
            msMailService.sendAuthenticatedMail {
                to toAddr
                from "dondenoncourt@gmail.com"
                subject "Personnel Action Requested from the Application Tracking System"
                body message
            }
        } else {
            sendMail {
                to toAddr
                from hr.email
                subject "Personnel Action Requested from the Application Tracking System"
                body message
            }
        }
        render "Email sent"
    }
    @AuthorizeOperation( level='4', text='Internal job posting' )
    def internalPosting = {
        [req:Requisition.get(params.id)]
    }
    @AuthorizeOperation( level='4', text='Job internally posted' )
    def internalPosted = {
        def req = Requisition.get(params.id)
        assert req
        req.internalPosted = new Date()
        RequisitionStatus changedStatus = statusService.activity(req)  
        if (changedStatus) {
            flash.message = "Requisition ${req.id} status changed to ${changedStatus.id}:${changedStatus.desc}"
        }
        redirect(action: "list")
    }
    @AuthorizeOperation( level='4', text='Job externally posted' )
    def externalPosting = {
        [req:Requisition.get(params.id)]
    }
    @AuthorizeOperation( level='4', text='Job external posted' )
    def externalPosted = {
        def req = Requisition.get(params.id)
        assert req
        req.externalPosted = new Date()
        RequisitionStatus changedStatus = statusService.activity(req)  
        if (changedStatus) {
            flash.message = "Requisition ${req.id} status changed to ${changedStatus.id}:${changedStatus.desc}"
        }
        redirect(action: "list")
    }
    @AuthorizeOperation( level='4', text='Select interview team' )
    def pickInterviewTeam = {
        [req:Requisition.get(params.id)]
    }
    def picked = { // ajax
        def req = Requisition.get(params.id)
        req.picked = new Date()
        assert req.save()
        render "OK"
    }
    @AuthorizeOperation( level='4', text='Send offer lettter' )
    def sendOfferLetter = {
        RequisitionCandidate reqCandi = RequisitionCandidate.get(params.id)
        assert reqCandi 
        reqCandi.offerLetter = new Date()
        reqCandi.save()
        def offerLetter = request.getFile('offerLetter') 
        List<File> attachments = fileService.getOfferLetterAttachments()
        def email = []
        email << reqCandi.candidate.email 
        
        msMailService.sendAuthenticatedMail {
            multipart true
            // TODO guess mime types from document filename
            attachBytes offerLetter.getOriginalFilename(), 'application/unknown', offerLetter.getBytes()
            attachments.each {file ->
                attachBytes file.name, 'application/unknown', file.readBytes()
            }
            attachBytes 'job_description.txt', 'text/unkine', reqCandi.requisition.jobD.job.getBytes()
            to email
            from "jobs@daffron.com"
            subject "Daffron offer letter"
            body "offer letter attached\n\n"
        }
        flash.message = "Offer letter sent to ${reqCandi.candidate.name}"    
        redirect controller:'candidate', action:'postInterview', id:reqCandi.requisition.id 
    }
    def offerResponse = { // ajax
        RequisitionCandidate reqCandi = RequisitionCandidate.get(params.id)
        assert reqCandi 
        reqCandi.offerAccepted = params.offerAccepted=='true'?true:false
        reqCandi.offerResponse = new Date()
        reqCandi.save()
        render "Candidate response to offer updated."    
    }
    def statusBackdoor = {
        log.error "Mr Don Denoncourt: use an action that invokes the rules engine the goes to list"
        def req = Requisition.get(params.id)
        assert req
        def status = RequisitionStatus.get(params.statusId)
        assert status
        req.status = status
        assert req.save()
        flash.message = "requisition $req.id set to $params.statusId"
        redirect(action: "list")
    }
    def hoverMenuBuild = { // ajax
        def req = Requisition.get(params.id)
        def baseUri = CH.config.hr.localHttp.scheme + "://" + CH.config.hr.localHttp.serverName + ":" + CH.config.hr.localHttp.serverPort
        String rootPath = grailsApplication.parentContext.getServletContext().getRealPath("/")
        
        //new File( rootPath ).eachFileMatch(~/${session.user.id}.*.png/) {png -> png.delete() }
        def controllerActionLinks = buildActionLinks(req, baseUri, session).each{controllerActionLink ->
            def actionName = controllerActionLink.action
            pdfService.thumbnail("$baseUri${createLink(action:actionName,controller:'requisition')}/${req.id}", "${session.user.id}_requisition_${actionName}", session.user.id.toString())
        }
        render "OK"
    }
    def hoverMenu = { // ajax
        def req = Requisition.get(params.id)
        def baseUri = CH.config.hr.localHttp.scheme + "://" + CH.config.hr.localHttp.serverName + ":" + CH.config.hr.localHttp.serverPort
        
        String rootPath = grailsApplication.parentContext.getServletContext().getRealPath("/")
        def controllerActionLinks = buildActionLinks(req, baseUri, session)
        render template:'hoverMenu', model:[req:req, rootPath: rootPath, controllerActionLinks:controllerActionLinks]
    }
    private List buildActionLinks(Requisition req, def baseUri, def session) {
        def controllerActionLinks = [] // array of Expando of controller/action
        CandidateController.HOVER_MENU_STATUS_ACTION_MAP[req.status.id].each {actionName ->
            if (CandidateController.authorizedActionPages(session.user).find{it == actionName}) {  
                pdfService.thumbnail("$baseUri${createLink(action:actionName,controller:'candidate')}/${req.id}", "${session.user.id}_candidate_${actionName}", session.user.id.toString())
                if ((!req.candidates.size() && ['list', 'filter'].find{it == actionName}) ||
                    (actionName == 'testCompare' && !req.interviewTeam  ) ) {
                    return    // next each
                }
                controllerActionLinks << new Expando(controller:'candidate', action:"${actionName}")
            }
        }
        
        JobDescriptionController.HOVER_MENU_STATUS_ACTION_MAP[req.status.id].each {actionName ->
            if (JobDescriptionController.authorizedActionPages(session.user).find{it == actionName}) {
                pdfService.thumbnail("$baseUri${createLink(action:actionName,controller:'jobDescription')}/${req.id}", "${session.user.id}_jobDescription_${actionName}", session.user.id.toString())
                controllerActionLinks << new Expando(controller:'jobDescription', action:"${actionName}")
            }
            controllerActionLinks
        }
        
        RequisitionController.HOVER_MENU_STATUS_ACTION_MAP[req.status.id].each {actionName ->
            if (RequisitionController.authorizedActionPages(session.user).find{it == actionName}) {
                pdfService.thumbnail("$baseUri${createLink(action:actionName,controller:'requisition')}/${req.id}", "${session.user.id}_requisition_${actionName}", session.user.id.toString())
                controllerActionLinks << new Expando(controller:'requisition', action:"${actionName}")
            }
        }
        
        // move next page/action to the top of the list
        def nextPage = session.user.hrAdmin?req.status.nextPageHr:session.user.employee.supervisor?req.status.nextPageSuper:''
        if (nextPage) {
            def makeFirstLink = new Expando(controller: nextPage.split('/')[0], action: nextPage.split('/')[1])
            if (req.status.id == 'SINTD' && !req.interviewTeam) {
                makeFirstLink = new Expando(controller: 'requisition', action: 'pickInterviewTeam')
            }
            def removeThisOne = controllerActionLinks.find{it.controller == makeFirstLink.controller && it.action == makeFirstLink.action}
            if (removeThisOne) {
                controllerActionLinks = controllerActionLinks - removeThisOne    
            }
            def newLinks = []
            newLinks << makeFirstLink
            controllerActionLinks.each{ newLinks << it}
            controllerActionLinks = newLinks
        }
        controllerActionLinks
    }
    @AuthorizeOperation( level='1', text='Approve hiring' )
    def approveHiring = {
        Requisition req = Requisition.get(params.id)
        assert req
        if (params.approve) {
            req.approvedForHire = new Date()
            req.hireComment = params.hireComment
            assert req.save(flush:true)
            statusService.activity(req)  
        } else {
            flash.message = "Requistion ${req.id} not approved as the approve checkbox was not selected"
        }
        
        redirect(action: "list")
    }
    @AuthorizeOperation( level='1', text='Requisition list' )
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 40, 100)
        [reqList: Requisition.list(params), reqTotal: Requisition.count()]
    }
    def statusHelp = { // ajax
        render template:'statusHelp'
    }
    def openReqs = {
        def candidate = Candidate.get(params.id)
        assert candidate
        def list = Requisition.withCriteria {
            status {
                'in' ('id', ['PREPOSTING', 'IPOSTED', 'XPOSTED', 'HRSELECT'])
            }    
        }
        render view:'openReqs', model:[list:list, candidate:candidate]
    }
    def assignCandiToReq = { // ajax
        Requisition req = Requisition.get(params.id)
        assert req
        def candidate = Candidate.get(params.candiId)
        assert candidate
        def reqCandi = new RequisitionCandidate(requisition:req, candidate:candidate, rank:0)
        assert reqCandi.save()
        req.addToCandidates(reqCandi)
        assert req.save()
        render "${candidate.name} assigned to Req: ${req.id}"
    }

    @AuthorizeOperation( level='1', text='create requisition' )
    def create = {
        def req = new Requisition(status:RequisitionStatus.get('NEW'))
        req.properties = params
        render view:'edit', model:[req: req, action:'create']
    }

    @AuthorizeOperation( level='1', text='save requisition' )
    def save = {
        def req = new Requisition(params)
        params.approver.eachWithIndex {empNo, idx ->
            def mustOk = params.mustOk[idx] == 'true' ? true : false
            def emp = EmployeePayrollMaster.get(empNo)
            if (!emp) {
                flash.message = "No employee master record found for employee number: ${empNo}"
                render(view: "edit", model: [req: req, action:'edit'])
                return
            }
            req.addToApprovedBy(new ApproveRequisition(employee:EmployeePayrollMaster.get(empNo), mustOk:mustOk))
        }
        if (req.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'requisition.label', default: 'Requisition'), req.id])}"
            statusService.activity(req)  
            // for supervisors, create a duplicate jobd
            if (session.user.employee?.supervisor) {
                redirect(controller:'jobDescription', action: "create", id: req.jobD.id, params:[reqId:req.id])
            } else {
                redirect(controller:'requisition', action: "list")
            }
        } else {
            req.errors.each{println it}
            render(view: "edit", model: [req: req, action:'edit'])
        }
    }

    @AuthorizeOperation( level='1', text='display requisition' )
    def show = {
        def req = Requisition.get(params.id)
        if (!req) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'requisition.label', default: 'Requisition'), params.id])}"
            redirect(action: "list")
        } else {
            if (!session.user && params.userId) {
                session.user = User.get(params.userId)
            }
            render view:'edit', model:[req: req, action:'show']
        }
    }

    @AuthorizeOperation( level='4', text='Backdoor to add candidates ' )
    def edit = {
        def req = Requisition.get(params.id)
        if (!req) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'requisition.label', default: 'Requisition'), params.id])}"
            redirect(action: "list")
        } else {
            return [req: req, action:'edit']
        }
    }

    @AuthorizeOperation( level='1', text='update requisition' )
    def update = {
        def req = Requisition.get(params.id)
        if (req) {
            if (params.version) {
                def version = params.version.toLong()
                if (req.version > version) {
                    req.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'requisition.label', default: 'Requisition')] as Object[], "Another user has updated this Requisition while you were editing")
                    render(view: "edit", model: [req: req])
                    return
                }
            }
            req.properties = params
            if (!req.hasErrors() && req.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'requisition.label', default: 'Requisition'), req.id])}"
                redirect(action: "list")
            } else {
                render(view: "edit", model: [req: req, action:'edit'])
            }
        } else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'requisition.label', default: 'Requisition'), params.id])}"
            redirect(action: "list")
        }
    }
    @AuthorizeOperation( level='9', text='delete all requisitions' )
    def deleteAll = {
        Requisition.list().each{ req ->
            try {
                req.delete()
            } catch ( e) {
                println "error deleting req ${req.id}:"+e
            }
        }
    flash.message = "All requisitions have been deleted"
    redirect(action: "list")
    }
    @AuthorizeOperation( level='1', text='delete requisition' )
    def delete = {
        def req = Requisition.get(params.id)
        if (req) {
            try {
                req.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'requisition.label', default: 'Requisition'), params.id])}"
                redirect(action: "list")
            } catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'requisition.label', default: 'Requisition'), params.id])}"
                log.error e
                redirect(action: "list")
            }
        } else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'requisition.label', default: 'Requisition'), params.id])}"
            redirect(action: "list")
        }
    }
    def supervisorNames = { // ajax
        render (EmployeePayrollMaster.findAllByNameIlikeAndSupervisor("%${params.name}%", true) as JSON)
    }
    def empNames = {// ajax
        EmployeePayrollMaster supervisor = EmployeePayrollMaster.findByNameIlike(params.supervisorName+'%'?:'')
        if (supervisor) {
            render (EmployeePayrollMaster.findAllBySupervisorEmpNoAndNameIlike(supervisor.id, "%${params.name}%") as JSON)
        } else {
            render (EmployeePayrollMaster.findAllByNameIlike("%${params.name}%") as JSON)
        }
    }
    def empNoByName = {// ajax
        def id = EmployeePayrollMaster.findByNameIlike(params.name.trim()+'%')?.id?:''
        log.debug "id for ${params.name} is $id"
        render id
    }
    def superEmployees = {
        def employees = EmployeePayrollMaster.findAllBySupervisorEmpNo(params.id, ['sort':'name'])
        render g.select(name:"replacing.id", from:employees, optionKey:'id',
                        noSelection:[null:'Select One...'])
    }
    def superCompensationTeam = {
		def emp = EmployeePayrollMaster.get(params.id)
        def employees = CompensationTeam.findAllByDepartment(emp.department)
		render g:select(from:CompensationTeam.findAllByDepartment(emp.department), optionKey:"employeeId", name:"approver", class:"compensationTeam")
    }
    def addInterviewer = { // ajax
        def req = Requisition.get(params.id)
        assert req
        def emp = EmployeePayrollMaster.get(params.empNo)
        assert emp
        if (!req.interviewTeam.find{it.emp.id == emp.id}) {
            req.addToInterviewTeam(new Interviewer(emp:emp))
            assert req.save()
            render emp.name
        } else {
            render "duplicate"
        }
    }
    @AuthorizeOperation( level='1', text='Approve candidate for hire' )
    def approve = {
        def req = Requisition.get(params.id)
        assert req
        println "ApproveRequistion.isApprover()"+ApproveRequisition.isApprover(session.user.employee, req)
        println session.user.employee
        if (ApproveRequisition.isApprover(session.user.employee, req)) {
            def approve = ApproveRequisition.findByRequisitionAndEmployee(req, session.user.employee)
            approve.approved = new Date()
            assert approve.save()
            flash.message = "Your approval has been registered in the request"
        } else {
            flash.message = "Your job class is not on the requistion approval list of "+Approve.list()
        }
        redirect(action: "next", id: req.id)
    }
    @AuthorizeOperation( level='9', text='Backdoor to add candidates ' )
    def stuffCandi = {
        def req = Requisition.get(params.id)
        assert req
        def candiMap = [ name:'One Person', email:'dondenoncourt@gmail.com', phoneNo:'1231231234', altPhoneNo:'', refer:'', relations:'', created:new Date(), updated:new Date(), totalYearsEdu:12, 'addr.line1':'100 First Stree', 'addr.city':'Nowheresville', 'addr.state':'VA', 'addr.zip':'12345' ] 
        ['First Person', 'Second Person', 'Third Person'].each {name ->
            candiMap.name = name
            def candi = new Candidate(candiMap)
            YesNo.findAllByShortNameIsNotNull().each{yesNo -> candi.addToYesNoAns(new YesNoAns(yesNo:yesNo, answer:true)) }
            candi.addToEducation(new Education(descr:'Central', highOrGED:true,years:11,study:'General',degree:''))
            if (!candi.save()) { candi.errors.each{println it} }
            assert new RequisitionCandidate(requisition:req, candidate:candi, rank:0).save()
        }
        render 'added'        
    }
    
    @AuthorizeOperation( level='9', text='Reload status rules and restart rules engine' )
    def loadStatusRules = {    
        StatusService.loadStatusRules()
        render 'Status rules reloaded'
    }
}
