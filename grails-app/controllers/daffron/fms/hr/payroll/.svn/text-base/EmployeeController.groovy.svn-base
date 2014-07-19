package daffron.fms.hr.payroll

import grails.converters.JSON

class EmployeeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def beforeInterceptor = {
		log.debug("action: $actionName params: $params flash: $flash")
	}
	def empNames = {
		render (EmployeePayrollMaster.findAllByNameIlike("%${params.name}%") as JSON)
    }
	def empNoByName = {
		println (EmployeePayrollMaster.findByName(params.name)?.id?:'')
		render (EmployeePayrollMaster.findByName(params.name)?.id?:'')
    }
}