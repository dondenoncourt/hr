package daffron.fms.hr.recruiting

import org.springframework.dao.DataIntegrityViolationException

class ApproveController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [approveInstanceList: Approve.list(params), approveInstanceTotal: Approve.count()]
    }

    def create() {
        [approveInstance: new Approve(params)]
    }

    def save() {
        def approveInstance = new Approve(params)
        if (!approveInstance.save(flush: true)) {
            render(view: "create", model: [approveInstance: approveInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'approve.label', default: 'Approve'), approveInstance.id])
        redirect(action: "show", id: approveInstance.id)
    }

    def show() {
        def approveInstance = Approve.get(params.id)
        if (!approveInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'approve.label', default: 'Approve'), params.id])
            redirect(action: "list")
            return
        }

        [approveInstance: approveInstance]
    }

    def edit() {
        def approveInstance = Approve.get(params.id)
        if (!approveInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'approve.label', default: 'Approve'), params.id])
            redirect(action: "list")
            return
        }

        [approveInstance: approveInstance]
    }

    def update() {
        def approveInstance = Approve.get(params.id)
        if (!approveInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'approve.label', default: 'Approve'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (approveInstance.version > version) {
                approveInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'approve.label', default: 'Approve')] as Object[],
                          "Another user has updated this Approve while you were editing")
                render(view: "edit", model: [approveInstance: approveInstance])
                return
            }
        }

        approveInstance.properties = params

        if (!approveInstance.save(flush: true)) {
            render(view: "edit", model: [approveInstance: approveInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'approve.label', default: 'Approve'), approveInstance.id])
        redirect(action: "show", id: approveInstance.id)
    }

    def delete() {
        def approveInstance = Approve.get(params.id)
        if (!approveInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'approve.label', default: 'Approve'), params.id])
            redirect(action: "list")
            return
        }

        try {
            approveInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'approve.label', default: 'Approve'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'approve.label', default: 'Approve'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
