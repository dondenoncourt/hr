package daffron.fms.hr.recruiting

import groovy.lang.Binding
import groovy.lang.Delegate;
import groovy.lang.Script;
import daffron.fms.hr.User
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH
import grails.util.Environment
import org.codehaus.groovy.control.CompilerConfiguration 
import org.codehaus.groovy.control.customizers.*

abstract class RequisitionBaseScriptClass extends Script {
	@Delegate @Lazy Requisition requisition = this.binding.requisition
}

public class StatusService {
	def mailService
	def msMailService
	static boolean NEW_activity_provided = true
	static boolean APPROVE_activity_provided = true
	static boolean JOBDMOD_activity_provided = true
	static boolean PREPOSTING_activity_provided = true
	static boolean IPOSTED_activity_provided = true
	static boolean XPOSTED_activity_provided = true
	static boolean HRSELECT_activity_provided = true
	static boolean SUPERSELECT_activity_provided = true
	static boolean PRECONTACT_activity_provided = true
	static boolean SCHTEST_activity_provided = true
	static boolean TESTING_activity_provided = true
	static boolean PICK_activity_provided = true
	static boolean SINTD_activity_provided = true
	static boolean INTERVIEW_activity_provided = true
	static boolean BCKGRDCHK_activity_provided = true
	static boolean OFFERDRUG_activity_provided = true
	static boolean DRUG_activity_provided = true
	static boolean OFFER_activity_provided = true
	static boolean SUPERSIGNHIRE_activity_provided = true
	static boolean PRESCREEN_activity_provided = true
	static boolean PHONEINTV_activity_provided = true
	
	def static APPROVE_activity = 	{ APPROVE_activity_provided = false }
	def static JOBDMOD_activity = 	{ JOBDMOD_activity_provided = false	}
	def static PREPOSTING_activity =	{ PREPOSTING_activity_provided = false }
	def static IPOSTED_activity =		{ IPOSTED_activity_provided = false }
	def static XPOSTED_activity =     { XPOSTED_activity_provided = false }
	def static HRSELECT_activity =    { HRSELECT_activity_provided = false }
	def static SUPERSELECT_activity = { SUPERSELECT_activity_provided = false }
	def static PRECONTACT_activity =  { PRECONTACT_activity_provided = false }
	def static SCHTEST_activity =     { SCHTEST_activity_provided = false }
	def static TESTING_activity =     { TESTING_activity_provided = false }
	def static PICK_activity =        { PICK_activity_provided = false }
	def static SINTD_activity =       { SINTD_activity_provided = false }
	def static INTERVIEW_activity =   { INTERVIEW_activity_provided = false }
	def static BCKGRDCHK_activity =   { BCKGRDCHK_activity_provided = false }
	def static OFFERDRUG_activity =   { OFFERDRUG_activity_provided = false }
	def static OFFER_activity =       { OFFER_activity_provided = false }
	def static DRUG_activity =        { DRUG_activity_provided = false }
	def static SUPERSIGNHIRE_activity={ SUPERSIGNHIRE_activity_provided = false }
	def static NEW_activity =         { NEW_activity_provided = false }
	def static PRESCREEN_activity=    { PRESCREEN_activity_provided = false }
	def static PHONEINTV_activity=    { PHONEINTV_activity_provided = false }

	void prepareClosures (Binding binding) {
		binding.NEW_activity = NEW_activity
		binding.APPROVE_activity = APPROVE_activity
		binding.JOBDMOD_activity = JOBDMOD_activity
		binding.PREPOSTING_activity = PREPOSTING_activity
		binding.IPOSTED_activity = IPOSTED_activity
		binding.XPOSTED_activity = XPOSTED_activity
		binding.HRSELECT_activity = HRSELECT_activity
		binding.SUPERSELECT_activity = SUPERSELECT_activity
		binding.INTERVIEW_activity = INTERVIEW_activity
		binding.PRECONTACT_activity = PRECONTACT_activity
		binding.TESTING_activity = TESTING_activity
		binding.PICK_activity = PICK_activity
		binding.SINTD_activity = SINTD_activity
		binding.BCKGRDCHK_activity = BCKGRDCHK_activity
		binding.OFFERDRUG_activity = OFFERDRUG_activity
		binding.OFFER_activity = OFFER_activity
		binding.DRUG_activity = DRUG_activity
		binding.SUPERSIGNHIRE_activity = SUPERSIGNHIRE_activity
		binding.PRESCREEN_activity = PRESCREEN_activity
		binding.PHONEINTV_activity = PHONEINTV_activity
		
		binding.status = { spec, closure ->
			closure.delegate = delegate
			closure()
		}
	}
	static void loadStatusRules() {
		Binding binding = new Binding()
			
		binding.NEW_activity = NEW_activity
		binding.APPROVE_activity = APPROVE_activity
		binding.JOBDMOD_activity = JOBDMOD_activity
		binding.PREPOSTING_activity = PREPOSTING_activity
		binding.IPOSTED_activity = IPOSTED_activity
		binding.XPOSTED_activity = XPOSTED_activity
		binding.HRSELECT_activity = HRSELECT_activity
		binding.SUPERSELECT_activity = SUPERSELECT_activity
		binding.INTERVIEW_activity = INTERVIEW_activity
		binding.PRECONTACT_activity = PRECONTACT_activity
		binding.TESTING_activity = TESTING_activity
		binding.PICK_activity = PICK_activity
		binding.SINTD_activity = SINTD_activity
		binding.BCKGRDCHK_activity = BCKGRDCHK_activity
		binding.OFFERDRUG_activity = OFFERDRUG_activity
		binding.OFFER_activity = OFFER_activity
		binding.DRUG_activity = DRUG_activity
		binding.SUPERSIGNHIRE_activity = SUPERSIGNHIRE_activity
		binding.PRESCREEN_activity = PRESCREEN_activity
		binding.PHONEINTV_activity = PHONEINTV_activity
		
		GroovyShell shell = new GroovyShell(binding)
		try {
			println 'load status rules from:'+CH.config.hr.props.loc
			def hrPropsLoc = Environment.current == Environment.TEST ? CH.config['hr.props.loc']  : CH.config.hr.props.loc
			shell.evaluate(new File(hrPropsLoc+"StatusRules.groovy")) // get from external loc
		} catch (e) {
			println e
		}

		NEW_activity = binding.NEW_activity 
		APPROVE_activity = binding.APPROVE_activity 
		JOBDMOD_activity = binding.JOBDMOD_activity 
		PREPOSTING_activity = binding.PREPOSTING_activity 
		IPOSTED_activity = binding.IPOSTED_activity
		XPOSTED_activity = binding.XPOSTED_activity
		HRSELECT_activity = binding.HRSELECT_activity
		SUPERSELECT_activity = binding.SUPERSELECT_activity
		INTERVIEW_activity = binding.INTERVIEW_activity
		PRECONTACT_activity = binding.PRECONTACT_activity
		TESTING_activity = binding.TESTING_activity
		PICK_activity = binding.PICK_activity
		SINTD_activity = binding.SINTD_activity
		BCKGRDCHK_activity = binding.BCKGRDCHK_activity
		OFFERDRUG_activity = binding.OFFERDRUG_activity
		OFFER_activity = binding.OFFER_activity
		DRUG_activity = binding.DRUG_activity
		SUPERSIGNHIRE_activity = binding.SUPERSIGNHIRE_activity
		PRESCREEN_activity = binding.PRESCREEN_activity
		PHONEINTV_activity = binding.PHONEINTV_activity
	}
	RequisitionStatus activity(Requisition req) {
		def closureName =  "${req.status.id}_activity"
		println "StartService running ${closureName}"
		def beforeStatus = req.status
		if (StatusService."${closureName}_provided")  {
			Binding binding = new Binding([ requisition:req ] )
			def importCustomizer = new ImportCustomizer()
			importCustomizer.addImports 'daffron.fms.hr.recruiting.Requisition', 'daffron.fms.hr.recruiting.RequisitionBaseScriptClass' 
			def config = new CompilerConfiguration() 
			config.addCompilationCustomizers importCustomizer
			config.scriptBaseClass =  RequisitionBaseScriptClass.class.name
			binding.sendMail = mailService.&sendMail
			if (Environment.DEVELOPMENT == Environment.current) {
				binding.sendAuthenticatedMail = mailService.&sendMail
			} else if (Environment.TEST == Environment.current) {
			   binding.sendAuthenticatedMail = this.&dontBotherSendingEmailInTest
			} else {
				binding.sendAuthenticatedMail = msMailService.&sendAuthenticatedMail
			}
			binding.nextStatus = Requisition.&nextStatus
			binding.status = req.status
			prepareClosures(binding)
			GroovyShell shell = new GroovyShell(this.class.classLoader, binding, config)
			shell.evaluate("${closureName}.delegate = this;println 'run script...'; ${closureName}();println '...script ran'")
		} else {
			println "StartService could not find StatusService.${closureName}_provided"
			assert false
		}
		if (beforeStatus != req.status) {
			return req.status
		}
	}
	static def dontBotherSendingEmailInTest(Closure clo) {
		// don't do anything	
	}

}

