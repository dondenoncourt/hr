package daffron.fms.hr.recruiting

import java.util.Map;

import daffron.fms.hr.User;


class JobDescriptionController {
	//static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def statusService 
	
	def beforeInterceptor = {
		log.debug("action: $actionName params: $params flash: $flash")
	}
	def afterInterceptor = {
		log.debug("action after: $actionName params: $params flash: $flash")
	}

	def index = {
		redirect(action: "list", params: params)
	}

	static def HOVER_MENU_STATUS_ACTION_MAP = [
		JOBDMOD:['diff']
	]
	static List authorizedActionPages(User user) {
		user.hrAdmin?['diff']:[]
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.sort = params.sort?:'id'
		// if a JobD has a prodJobD attribute then it is a temporary copy that needs to be approved 
		[jobDList: JobDescription.findAllByProdJobDIsNull(params), jobDTotal: JobDescription.count()]
	}

	def diff = {
        def req = Requisition.get(params.id)
		assert req
		def tempJobD = JobDescription.findByProdJobD(req.jobD)
		if (!tempJobD) {
			flash.message = "Job Description has not been modified"
			redirect action:'list', controller:'requisition'
		}
		[tempJobD:tempJobD, prodJobD:req.jobD, req:req]
	}
	def create = {
		def jobD = new JobDescription()
		jobD.properties = params
		if (params.id) { // if passed (from requisition:save()), a copy of the production JobD is required
			JobDescription prodJobD = JobDescription.get(params.id.toLong())
			jobD.properties = prodJobD.properties
			jobD.prodJobD = prodJobD 
			jobD.jobClass = prodJobD.jobClass
		}
		render view:'edit', model:[jobD: jobD, copyOfJobD:params.id as boolean, reqId:params.reqId]
	}

	def superOkJobD = {
		statusService.activity(Requisition.get(params.id.toLong()))
		redirect(controller:'requisition', action: "list")
	}
	def save = {
		def jobD = new JobDescription(params)
		if (jobD.save(flush: true)) {
			if (params.reqId) {
				def req = Requisition.get(params.reqId.toLong())
				statusService.activity(req)
			}
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'jobDescription.label', default: 'JobDescription'), jobD.id])}"
			redirect(controller:'requisition', action: "list")
		} else {
			if (jobD.errors.hasFieldErrors('prodJobD')) {
				flash.message = "${message(code: 'jobDescription.prodJobD.validator.error', args: [message(code: 'jobDescription.label', default: 'JobDescription'), jobD.id])}"
				redirect(controller:'requisition', action: "list")
				return
			}
			render view:'edit', model:[jobD: jobD]
		}
	}

	def show = {
		def jobD = JobDescription.get(params.id)
		if (!jobD) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobDescription.label', default: 'JobDescription'), params.id])}"
			redirect(action: "list")
		} else {
			[jobD: jobD]
		}
	}

	def edit = {
		def jobD = JobDescription.get(params.id)
		if (!jobD) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobDescription.label', default: 'JobDescription'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [jobD: jobD]
		}
	}

	def update = {
		def jobD = JobDescription.get(params.id)
		if (jobD) {
			if (params.version) {
				def version = params.version.toLong()
				if (jobD.version > version) {
					jobD.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'jobDescription.label', default: 'JobDescription')]
					as Object[], "Another user has updated this JobDescription while you were editing")
					render(view: "edit", model: [jobD: jobD])
					return
				}
			}
			jobD.properties = params
			if (!jobD.hasErrors() && jobD.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'jobDescription.label', default: 'JobDescription'), jobD.id])}"
				def jobDMod = JobDescription.findByProdJobD(jobD)
				if (jobDMod && params.reqId) {
					def req = Requisition.get(params.reqId.toLong())
					log.debug "trying to delete ${jobDMod.id} of prodJobD ${jobDMod.prodJobD.id}"
					jobDMod.prodJobD = null
					jobDMod.delete() 
					statusService.activity(req) // if all results are in, move to next status?
				}
				redirect(action: "list", controller:'requisition')
			} else {
				render(view: "edit", model: [jobD: jobD])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobDescription.label', default: 'JobDescription'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def jobD = JobDescription.get(params.id)
		if (jobD) {
			try {
				jobDMod.yesNo*.delete()
				jobDMod.techNeeds*.delete()
				jobDMod.tests*.delete()
				jobD.delete()
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'jobDescription.label', default: 'JobDescription'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'jobDescription.label', default: 'JobDescription'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobDescription.label', default: 'JobDescription'), params.id])}"
			redirect(action: "list")
		}
	}
}
