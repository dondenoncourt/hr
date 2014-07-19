package daffron.fms.hr.recruiting

import grails.test.*
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH

import daffron.fms.hr.payroll.EmployeePayrollMaster;

class RecruitingTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
		CH.config = new groovy.util.ConfigObject()
		CH.config.putAt 'hr.schema', 'hrpixpgle' 
		def jcds = []
		def jcd = new JobClassDescription(title:'cfo')
		jcd.id = 'cfo'
		jcds << jcd
		jcd = new JobClassDescription(title:'gm')
		jcd.id = 'gm'
		jcds << jcd
		jcd = new JobClassDescription(title:'bluecollar')
		jcd.id = 'bluecollar'
		jcds << jcd
		jcd = new JobClassDescription(title:'manager')
		jcd.id = 'manager'
		jcds << jcd
		jcd = new JobClassDescription(title:'hr')
		jcd.id = 'hr'
		jcds << jcd
		jcd = new JobClassDescription(title:'super')
		jcd.id = 'super'
		jcds << jcd
		mockDomain(JobClassDescription, jcds)
		mockDomain(Approve, [
								new Approve(jobClass:JobClassDescription.get('gm')),
								new Approve(jobClass:JobClassDescription.get('cfo'))
							]
		)
		assertEquals 2, Approve.count()
		assertNotNull Approve.list()[0].jobClass
		
		def emps = []
		emps << new EmployeePayrollMaster(id:1,name:'cfo', jobClass:JobClassDescription.get('cfo').id)
		emps <<	new EmployeePayrollMaster(id:2,name:'gm', jobClass:JobClassDescription.get('gm').id)
		emps <<	new EmployeePayrollMaster(id:3,name:'super', supervisorEmpNo:5, jobClass:JobClassDescription.get('super').id)
		emps <<	new EmployeePayrollMaster(id:4,name:'hr', jobClass:JobClassDescription.get('hr').id)
		emps <<	new EmployeePayrollMaster(id:5,name:'superssuper', jobClass:JobClassDescription.get('manager').id)
		mockDomain (EmployeePayrollMaster, emps)
		assertEquals 5, EmployeePayrollMaster.count()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testApproved() {
		mockDomain(Requisition)
		def req = new Requisition(supervisor:EmployeePayrollMaster.get(3)) // created by super
		assertEquals false, req.approved // no approvers yet
		
		req.addToApprovedBy(EmployeePayrollMaster.findByName('gm'))
		assertEquals false, req.approved // only 1 approver
		
		req.addToApprovedBy(EmployeePayrollMaster.findByName('gm'))
		assertEquals false, req.approved // gm already in

		req.addToApprovedBy(EmployeePayrollMaster.findByName('cfo'))
		assertEquals false, req.approved // super's super not in approver list yet
		
		req.addToApprovedBy(EmployeePayrollMaster.findByName('superssuper'))
		assertEquals true, req.approved
    }
}
