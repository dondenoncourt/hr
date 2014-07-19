package daffron.fms.hr.enrollment

import daffron.fms.hr.payroll.EmployeePayrollMaster;
import grails.converters.*

class EnrollController {
	def enrollService
	
	PopulateFromCSVService populateFromCSVService
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def beforeInterceptor = {
		log.debug("action: $actionName params: $params flash: $flash")
	}

    def index = {
        redirect(action: "list", params: params)
    }
	
	def populateFromCSV = {
		populateFromCSVService.populate(params.csvLoc)
		render "populate ran, check tomcat log to see if domain errors were generated...."
	}
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def enrollList
		def kount = 0
		if (params.name) {
			enrollList = Enroll.withCriteria () {
				employee { like 'name',  params.name+'%' }
			}
			kount = Enroll.withCriteria (uniqueResult:true) {
				employee { like 'name',  params.name+'%' }
				projections {rowCount()}
			}
		} else {
			enrollList = Enroll.list(params)
			kount = Enroll.count()
		}
        [enrollList: enrollList, enrollTotal: kount]
    }
	
	def contactInfo = {
		def enroll
		if (params.id == null) {
			enroll = Enroll.withCriteria (uniqueResult:true) {
				employee {
					eq 'id',  session.user?.employeeNo
				}
			}
			if (!enroll) {
				flash.message="Employee not found " + session.user.employeeNo
				redirect controller:"login",action:"home"
				return
			}
		} else {
			enroll = Enroll.get(params.id.toInteger())
		}
		
		render view:'contactInfoEdit', model:[enroll:enroll]
	}
	
	def healthPlan = {
		def enroll = Enroll.get(params.id)
		render view:'healthPlanEdit', model:[enroll:enroll]
	}
	
	def fsa = {
		def enroll = Enroll.get(params.id)
		render view:'fsaEdit', model:[enroll:enroll]
	}
	
	def voluntaryIns = {
		def enroll = Enroll.get(params.id)
		render view:'voluntaryInsEdit', model:[enroll:enroll]
	}
	
	def beneficiaryInfo = {
		def enroll = Enroll.get(params.id)
		render view:'beneficiaryInfoEdit', model:[enroll:enroll]
	}
	
	def completeEnrollment = {
		def enroll = Enroll.get(params.id)
		render view:'completeEnrollmentEdit', model:[enroll:enroll]
	}

	def getEmpJSON = {
		def emp = EmployeePayrollMaster.get(params.id)
		render emp  as JSON
	}
	def init = {
		enrollService.initEnrollment()
		flash.message = "The enrollment database has been populated from the payroll database"
		redirect action:'list'
	}
	def confirm = {
		[enroll:Enroll.get(params.id)]
	}
    def create = {
        def enroll = new Enroll()
        enroll.properties = params
        return [enroll: enroll]
    }

    def save = {
        def enroll = new Enroll(params)
        if (enroll.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'enroll.label', default: 'Enroll'), enroll.id])}"
            redirect(action: "show", id: enroll.id)
        } else {
            render(view: "create", model: [enroll: enroll])
        }
    }

    def show = {
        def enroll = Enroll.get(params.id)
        if (!enroll) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'enroll.label', default: 'Enroll'), params.id])}"
            redirect(action: "list")
        } else {
            [enroll: enroll]
        }
    }

    def edit = {
		def voluntaryInsuranceProducts = ['Critical Illness', 'Age Banded Voluntary Life/AD&amp;D:', 'Flat Rate Volutary Life/AD&amp;D:']
		session.voluntaryInsuranceProducts = voluntaryInsuranceProducts
        def enroll = Enroll.get(params.id)
        if (!enroll) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'enroll.label', default: 'Enroll'), params.id])}"
            redirect(action: "list")
        } else {
            return [enroll: enroll]
        }
    }

	def confirmHealthPlan = {
        def enroll = Enroll.get(params.id)
		assert enroll
		enroll.healthPlanSet = true
		assert enroll.save()
		redirect action:'fsa', id:params.id
	}
	static pages = ['contactInfoEdit', 'healthPlanEdit', 'fsaEdit', 'voluntaryInsEdit', 'beneficiaryInfoEdit', 'completeEnrollmentEdit']
	static pagesConfirmMap = [contactInfoEdit:'contactInfoSet', healthPlanEdit:'healthPlanSet', fsaEdit:'fsaSet', voluntaryInsEdit:'voluntaryInsSet', beneficiaryInfoEdit:'beneficiariesSet']
    def update = { // does not do voluntaryInsEdit
        def enroll = Enroll.get(params.id)
        if (enroll) {
			if (enroll.contact && params.view == 'contactInfoEdit') {
				enroll.contact.noChanges = false // "enroll.properties = params" will set this to true if checked but it doesn't if unchecked
			}
            enroll.properties = params
			if (params.view == 'contactInfoEdit' && !enroll.contact) {
				enroll.errors.reject("Please update your contact information or click the no changes checkbox")
                render(view: params.view?:'edit', model: [enroll: enroll])
				return
			}
			
			println "enroll.\"${(pagesConfirmMap[params.view])}\" = true"
			enroll."${(pagesConfirmMap[params.view])}" = true
            if (!enroll.hasErrors() && enroll.save(flush: true)) {
                flash.message = "Employee no: ${enroll.employee.id} enrollment data has been updated"
            } else {
                render(view: params.view?:'edit', model: [enroll: enroll])
				return
            }
        } else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'enroll.label', default: 'Enroll'), params.id])}"
        }
		println pages.find{it == params.view}	
		render view:pages[pages.indexOf(params.view)+1], model: [enroll:enroll]
    }
	def saveVolIns = {
		def enroll = Enroll.get(params.id)
		///params.each { println it }
		
		println "voluntaryInsurance.size()"+enroll.voluntaryInsurance?.size()
		
		def optionTypes = params.findAll {key, val -> key ==~ /^optionType.*/ }
		optionTypes.each {optionParam ->
			def matcher = optionParam  =~ /optionType-(.*)-(\w)/
			def product = matcher[0][1]
			def personType = matcher[0][2]
			def option = optionParam.value
			println "product: $product personType: $personType option: $option"
			def volIns = enroll.voluntaryInsurance.find{it.name == product && it.coveredPersonType == personType}
			if (!volIns) {
				volIns = new VoluntaryInsurance(name:product, coveredPersonType: personType, benefit:123456, optionType:option)
				assert enroll.addToVoluntaryInsurance(volIns).save()
				println "not found added"
			} else {
				println "found one"
			}
			volIns.optionType = option
		}
		enroll.voluntaryInsSet = true
		assert enroll.save()
		
		render view:pages[pages.indexOf(params.view)+1], model: [enroll:enroll]
	}


    def delete = {
        def enroll = Enroll.get(params.id)
        if (enroll) {
            try {
                enroll.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'enroll.label', default: 'Enroll'), params.id])}"
                redirect(action: "list")
            } catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'enroll.label', default: 'Enroll'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'enroll.label', default: 'Enroll'), params.id])}"
            redirect(action: "list")
        }
    }
	def promptNewCovered = {
        def enroll = Enroll.get(params.id)
		assert enroll
		def covered = new Covered(enroll:enroll)
		render template:'coveredEdit', model:[covered:covered, enroll:enroll, coveredRowNo:params.coveredRowNo, ajax:true]
	}
	def saveCovered = {
        def enroll = Enroll.get(params['enroll.id'])
		assert enroll 
		def covered = params['covered.id']?Covered.get(params['covered.id']):new Covered()
		assert covered
		covered.properties = params
		if (!covered.save(flush: true)) {
			covered.errors.each { println it }
		}
		render template:'coveredEdit', model:[covered:covered, enroll:enroll, coveredRowNo:params.coveredRowNo, ajax:true]
	}
	def deleteCovered = {
		def covered = Covered.get(params['covered.id']?.toLong()?:0)
		//assert covered
		covered?.delete()
		render ''
	}
	def promptNewOtherCoverage = {
		def enroll = Enroll.get(params.id)
		def otherCoverage = new OtherCoverage(enroll:enroll)
		render template:'otherCoverageEdit', model:[otherCoverage:otherCoverage, enroll:enroll, otherCoverageRowNo:params.otherCoverageRowNo, ajax:true]
	}
	def saveOtherCoverage = {
		def enroll = Enroll.get(params['enroll.id'])
		def otherCoverage = params.id?OtherCoverage.get(params.id):new OtherCoverage()
		otherCoverage.properties = params
		if (!otherCoverage.save(flush: true)) {
			otherCoverage.errors.each { println it }
		}
		render template:'otherCoverageEdit', model:[otherCoverage:otherCoverage, enroll:enroll, otherCoverageRowNo:params.otherCoverageRowNo, ajax:true]
	}
	def deleteOtherCoverage = {
		def otherCoverage = OtherCoverage.get(params.id)
		otherCoverage?.delete()
		render ''
	}
	def promptNewMedicare = {
		def enroll = Enroll.get(params.id)
		def medicare = new Medicare(enroll:enroll)
		render template:'medicareEdit', model:[medicare:medicare, enroll:enroll, medicareRowNo:params.medicareRowNo, ajax:true]
	}
	def saveMedicare = {
		def enroll = Enroll.get(params['enroll.id'])
		def medicare = params.id?Medicare.get(params.id):new Medicare()
		medicare.properties = params
		if (!medicare.save(flush: true)) {
			medicare.errors.each { println it }
		}
		render template:'medicareEdit', model:[medicare:medicare, enroll:enroll, medicareRowNo:params.medicareRowNo, ajax:true]
	}
	def deleteMedicare = {
		def medicare = Medicare.get(params.id)
		medicare?.delete()
		render ''
	}
	def promptNewBeneficiary = {
		def enroll = Enroll.get(params.id)
		assert enroll
		assert params.type
		def beneficiary = new Beneficiary(enroll:enroll, type:params.type)
		render template:'beneficiaryEdit', model:[beneficiary:beneficiary, enroll:enroll, beneficiaryRowNo:params.beneficiaryRowNo, beneType:params.type, ajax:true]
	}
	def saveBeneficiary = {
		def enroll = Enroll.get(params['enroll.id'])
		assert enroll
		def beneficiary = params.id?Beneficiary.get(params.id):new Beneficiary()
		assert beneficiary
		beneficiary.properties = params
		if (!beneficiary.save(flush: true)) {
			beneficiary.errors.each { println it }
//			assert false
		}
		render template:'beneficiaryEdit', model:[beneficiary:beneficiary, enroll:enroll, beneficiaryRowNo:params.beneficiaryRowNo, beneType:params.type, ajax:true]
	}
	def beneSameAsPrimary = {
		def enroll = Enroll.get(params.id)
		assert enroll
		def bene = enroll.beneficiaries.find{it.type == 'NRECA'}
		if (bene) {
			enroll.removeFromBeneficiaries(bene)
			bene.delete()
			enroll.save(flush:true)
		}
		if (params.sameAsPrimary == 'true') { // otherwise we probably just deleted it and do not want it
			enroll.addToBeneficiaries (new Beneficiary(type:'NRECA', sameAsPrimary:true))
			if (!enroll.save()) {
				enroll.errors.each{println it}
				assert false
			}
		} 
		render 'bene same as primary updated'
	}
	def deleteBeneficiary = {
		def beneficiary = Beneficiary.get(params.id)
		if (beneficiary) {
			beneficiary?.delete()
		} // else, it did not exist yet
		render ''
	}
	def sign = {
		def enroll = Enroll.get(params.id)
		assert enroll
		[enroll:enroll]
	}
	def verifySignature = {
		def enroll = Enroll.get(params.id)
		assert enroll	
		
		if(params.agree) {
			if (enroll.employee.id != params.employeeNo
			 || enroll.contact.firstName != params.firstName
			 || enroll.contact.mi == params.mi
			 || enroll.contact.lastName == params.lastName 
			 || enroll.employee.birthDate == params.dateOfBirth) {
			 	log.debug "enroll.employee.id: ${enroll.employee.id}"
				flash.message = 'Invalid Signature!'
				redirect action:'sign', id:enroll.id
				return
			}
			else {
				enroll.sign = new Date()
				if (!enroll.sign.save (flush:true)) {
					enroll.errors.each { println it }
					assert false
					flash.message = 'Enrollment NOT saved!'
					redirect action:'sign', id:enroll.id
					return
				}		
				//render 'savedSign'
				return
			}
		}
		if (!params.agree)
		{
			flash.message = 'You must select I Agree to continue!'
			redirect action:'sign', id:enroll.id		
		}
   }
}
