package daffron.fms.hr.safety

import grails.converters.JSON

class IncidentController {
	def mailService
	def msMailService
	def dataSource

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def beforeInterceptor = {
		log.debug("action: $actionName params: $params flash: $flash")
	}
	
    def index = {
        redirect(action: "list", params: params)
    }
	
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def incidentList
		def kount = 0
		if (params.employeeNamePrefix) {
			incidentList = Incident.withCriteria () {
				employee { like 'name',  params.employeeNamePrefix+'%' }
			}
			kount = Incident.withCriteria (uniqueResult:true) {
				employee { like 'name',  params.employeeNamePrefix+'%' }
				projections {rowCount()}
			}
		} else {
			incidentList = Incident.list(params)
			kount = Incident.count()
		}
        [incidentList: incidentList, incidentTotal: kount]
    }

    def create = {
        def incident = new Incident()
        incident.properties = params
        render view:'edit', model:[incident: incident, action:'create']
    }

    def save = {
        def incident = new Incident(params)
        if (incident.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'incident.label', default: 'Incident'), incident.id])}"
            redirect(action: "list")
        } else {
			incident.errors.each {println it}
            render(view: "edit", model: [incident: incident, action:'edit'])
        }
    }

    def show = {
        def incident = Incident.get(params.id)
        if (!incident) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'incident.label', default: 'Incident'), params.id])}"
            redirect(action: "list")
        }
		render view:'edit', model: [incident: incident, action:'show']
    }

    def edit = {
        def incident = Incident.get(params.id)
        if (!incident) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'incident.label', default: 'Incident'), params.id])}"
            redirect(action: "list")
			return 
        } 
        render view:'edit', model: [incident: incident, action:'edit']
    }

    def update = {
        def incident = Incident.get(params.id)
        if (incident) {
            if (params.version) {
                def version = params.version.toLong()
                if (incident.version > version) {
                    
                    incident.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'incident.label', default: 'Incident')] as Object[], "Another user has updated this Incident while you were editing")
                    render(view: "edit", model: [incident: incident])
                    return
                }
            }
            incident.properties = params
            if (!incident.hasErrors() && incident.save()) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'incident.label', default: 'Incident'), incident.id])}"
                redirect(action: "list")
            } else {
                render(view: "edit", model: [incident: incident, action:'edit'])
            }
        } else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'incident.label', default: 'Incident'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def incident = Incident.get(params.id)
        if (incident) {
            try {
                incident.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'incident.label', default: 'Incident'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'incident.label', default: 'Incident'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'incident.label', default: 'Incident'), params.id])}"
            redirect(action: "list")
        }
    }
	def addInjuryDetail = {
        def incident = Incident.get(params.id)
		if (incident) {
			def dtl = new InjuryDetail(incident:incident, bodyPart:'')
			assert dtl.save()
			incident.addToInjuryDetails(dtl)
		}
		assert incident.save(flush:true)
		render 'OK'
	}
	def docNames = {
		render (Doctor.findAllByNameLike("%${params.name}%") as JSON)
    }
	def docNoByName = {
		render (Doctor.findByName(params.name)?.id?:'')
    }
}
