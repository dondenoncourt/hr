package daffron.fms.hr.recruiting

import org.springframework.dao.DataIntegrityViolationException
import daffron.fms.hr.payroll.EmployeePayrollMaster
import daffron.fms.hr.payroll.GeneralConstants
import daffron.fms.hr.payroll.PrCodes
import daffron.fms.gl.Department

class CompensationTeamController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [compensationTeamInstanceList: CompensationTeam.list(params), compensationTeamInstanceTotal: CompensationTeam.count()]
    }

    def create() {
        [compensationTeamInstance: new CompensationTeam(params), departmentDescriptions: departmentDescriptions()]
    }

    def save() {
        def compensationTeamInstance = new CompensationTeam(params)
		compensationTeamInstance.id = params.id
		def emp = EmployeePayrollMaster.get(params['employee.id'])
		if (CompensationTeam.findByDepartmentAndEmployee(params.department.toString(), emp)) {
			flash.message = "A compensation team record already exists for deparment: ${params.department} employee: ${emp?.name}"
			redirect action:'create'
            return
    	}
        if (!compensationTeamInstance.save(flush: true)) {
            render(view: "create", model: [compensationTeamInstance: compensationTeamInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'compensationTeam.label', default: 'CompensationTeam'), compensationTeamInstance.id])
        redirect(action: "show", id: compensationTeamInstance.id)
    }

    def show() {
        def compensationTeamInstance = CompensationTeam.get(params.id)
        if (!compensationTeamInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'compensationTeam.label', default: 'CompensationTeam'), params.id])
            redirect(action: "list")
            return
        }

        [compensationTeamInstance: compensationTeamInstance]
    }

    def edit() {
        def compensationTeamInstance = CompensationTeam.get(params.id)
        if (!compensationTeamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compensationTeam.label', default: 'CompensationTeam'), params.id])
            redirect(action: "list")
            return
        }

        [compensationTeamInstance: compensationTeamInstance, departmentDescriptions: departmentDescriptions()]
    }

    def update() {
        def compensationTeamInstance = CompensationTeam.get(params.id)
        if (!compensationTeamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compensationTeam.label', default: 'CompensationTeam'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (compensationTeamInstance.version > version) {
                compensationTeamInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'compensationTeam.label', default: 'CompensationTeam')] as Object[],
                          "Another user has updated this CompensationTeam while you were editing")
                render(view: "edit", model: [compensationTeamInstance: compensationTeamInstance])
                return
            }
        }

        compensationTeamInstance.properties = params

        if (!compensationTeamInstance.save(flush: true)) {
            render(view: "edit", model: [compensationTeamInstance: compensationTeamInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'compensationTeam.label', default: 'CompensationTeam'), compensationTeamInstance.id])
        redirect(action: "show", id: compensationTeamInstance.id)
    }

    def delete() {
        def compensationTeamInstance = CompensationTeam.get(params.id)
        if (!compensationTeamInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'compensationTeam.label', default: 'CompensationTeam'), params.id])
            redirect(action: "list")
            return
        }

        try {
            compensationTeamInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'compensationTeam.label', default: 'CompensationTeam'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'compensationTeam.label', default: 'CompensationTeam'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	List departmentDescriptions() {
		if (GeneralConstants.findByConstantName('PR_UseGLDepartment')?.constantData == 'Y') {
			return Department.list()
		}
		PrCodes.findAllByField('EDPT')
	}	
}
