package daffron.fms.hr.enrollment
import daffron.fms.hr.enrollment.Covered;

class CoveredController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def beforeInterceptor = {
		log.debug("action: $actionName params: $params flash: $flash")
	}

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [coveredInstanceList: Covered.list(params), coveredInstanceTotal: Covered.count()]
    }

    def create = {
        def coveredInstance = new Covered()
        coveredInstance.properties = params
        return [coveredInstance: coveredInstance]
    }

    def save = {
        def coveredInstance = new Covered(params)
        if (coveredInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'covered.label', default: 'Covered'), coveredInstance.id])}"
            redirect(action: "show", id: coveredInstance.id)
        } else {
            render(view: "create", model: [coveredInstance: coveredInstance])
        }
    }

    def show = {
        def coveredInstance = Covered.get(params.id)
        if (!coveredInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'covered.label', default: 'Covered'), params.id])}"
            redirect(action: "list")
        } else {
            [coveredInstance: coveredInstance]
        }
    }

    def edit = {
        def coveredInstance = Covered.get(params.id)
        if (!coveredInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'covered.label', default: 'Covered'), params.id])}"
            redirect(action: "list")
        } else {
            return [coveredInstance: coveredInstance]
        }
    }

    def update = {
        def coveredInstance = Covered.get(params.id)
        if (coveredInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (coveredInstance.version > version) {
                    
                    coveredInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'covered.label', default: 'Covered')] as Object[], "Another user has updated this Covered while you were editing")
                    render(view: "edit", model: [coveredInstance: coveredInstance])
                    return
                }
            }
            coveredInstance.properties = params
            if (!coveredInstance.hasErrors() && coveredInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'covered.label', default: 'Covered'), coveredInstance.id])}"
                redirect(action: "show", id: coveredInstance.id)
            } else {
                render(view: "edit", model: [coveredInstance: coveredInstance])
            }
        } else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'covered.label', default: 'Covered'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def coveredInstance = Covered.get(params.id)
        if (coveredInstance) {
            try {
                coveredInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'covered.label', default: 'Covered'), params.id])}"
                redirect(action: "list")
            } catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'covered.label', default: 'Covered'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'covered.label', default: 'Covered'), params.id])}"
            redirect(action: "list")
        }
    }
}
