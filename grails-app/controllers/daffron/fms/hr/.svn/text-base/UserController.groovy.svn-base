package daffron.fms.hr

import daffron.fms.hr.payroll.EmployeePayrollMaster
import daffron.fms.hr.AuthorizeOperation
import grails.converters.JSON

class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST", empNames : "POST", empNoByName : "POST"]
	
	def beforeInterceptor = {
		log.debug("action: $actionName params: $params flash: $flash")
	}

    def index = {
        redirect(action: "list", params: params)
    }

	@AuthorizeOperation( level='9', text='User maintenance' )
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		if (params.employeeNamePrefix) {
	        [userInstanceList: User.findAllByFullNameLike("%${params.employeeNamePrefix}%", params), 
			userInstanceTotal: User.countByFullNameLike("%${params.employeeNamePrefix}%")]
		} else {
	        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
		}
    }

	@AuthorizeOperation( level='9', text='User maintenance' )
    def create = {
        def userInstance = new User()
        userInstance.properties = params
        return [userInstance: userInstance]
    }

	@AuthorizeOperation( level='9', text='User maintenance' )
    def save = {
        def userInstance = new User(params)
		userInstance.id = params.id
		userInstance.encryptPassword()
        if (userInstance.save(insert:true, flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
            redirect(action: "show", id: userInstance.id)
        }
        else {
            render(view: "create", model: [userInstance: userInstance])
        }
    }

	@AuthorizeOperation( level='9', text='User maintenance' )
    def show = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            [userInstance: userInstance]
        }
    }

	@AuthorizeOperation( level='9', text='User maintenance' )
    def edit = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userInstance: userInstance]
        }
    }

	@AuthorizeOperation( level='9', text='User maintenance' )
    def update = {
        def userInstance = User.get(params.id)
        if (userInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userInstance.version > version) {
                    
                    userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this User while you were editing")
                    render(view: "edit", model: [userInstance: userInstance])
                    return
                }
            }
            userInstance.properties = params
			if (params.password) {
				userInstance.encryptPassword()
			}
            if (!userInstance.hasErrors() && userInstance.save(insert:false, flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
                redirect(action: "show", id: userInstance.id)
            }
            else {
                render(view: "edit", model: [userInstance: userInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }

	@AuthorizeOperation( level='9', text='User maintenance' )
    def delete = {
        def userInstance = User.get(params.id)
        if (userInstance) {
            try {
                userInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }
	def empNames = {
		render (EmployeePayrollMaster.findAllByNameIlike("%${params.name}%") as JSON)
    }
	def empNoByName = {
		println (EmployeePayrollMaster.findByName(params.name)?.id?:'')
		render (EmployeePayrollMaster.findByName(params.name)?.id?:'')
    }
}
