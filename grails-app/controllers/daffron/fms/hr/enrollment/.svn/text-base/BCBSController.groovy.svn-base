package daffron.fms.hr.enrollment

import daffron.fms.hr.payroll.EmployeePayrollMaster;

class BCBSController {
	static scaffold = true
	def beforeInterceptor = {
		log.debug("action: $actionName params: $params flash: $flash")
	}

	def addEnrollment = {
		EmployeePayrollMaster employee = EmployeePayrollMaster.get(params.id)
//		def BCBSInstance = new BCBS(employee:employee)
//		render view:'create', model:[BCBSInstance:BCBSInstance]
		flash.message = "for now, with this prototype, select employee ${employee} from drop-down"
		redirect controller:'BCBS', action:'create'
	}
}
