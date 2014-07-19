package daffron.fms.hr.enrollment

import daffron.fms.hr.User

import groovy.sql.Sql
import planetj.util.CoderUtility

import  org.codehaus.groovy.grails.commons.ConfigurationHolder as CH
import grails.util.Environment

class LoginController {
	def sessionFactory

    static allowedMethods = [authenticate: "POST"]

	def beforeInterceptor = {
		log.debug("action: $actionName params: $params flash: $flash")
	}


    def index = {
        redirect(action: "login", params: params)
    }

	def home = {
		render view:'index'
	}
    def login = {}
    def logout = {
        session.user = null
		redirect(action:"login")
    }
 
    def authenticate = {
		def user = User.get(params.user)
		
		if (user?.isValidPassword(params.password)) {
			session.user = user
			
			if (session.preLoginURI != null && !session.preLoginURI.contains('login') && !session.preLoginURI.contains('null') ) {
				log.debug " LoginController::authenticate login session.preLoginURL ${session.preLoginURI} after check"
				redirect(url:"${session.preLoginURI}")
				return
			}
        	def baseUri = grailsApplication.config.hr.localHttp.scheme + "://" + grailsApplication.config.hr.localHttp.serverName + ":" + grailsApplication.config.hr.localHttp.serverPort + grailsAttributes.getApplicationUri(request)
            def xml = null
            def feeds = null
			try {
	            xml = "${baseUri}/feeds/feeds".toURL().text.replaceAll('&', '&#38;').replaceAll(/\x1a/, '')			
	            feeds = new XmlSlurper().parseText(xml)
			} catch (e) {
				println "error in feeds build:"+e
			}
			render view:"index", model:[feeds:feeds]
			return
		} else {
			flash.message = "Sign on failed."
			redirect(action:"login")
			return
		}
   }
	
   def testSingleSignon = {
		Sql sql = new Sql(sessionFactory.getCurrentSession().connection())
		def rs = sql.firstRow("SELECT USPWD FROM ${Environment.DEVELOPMENT?CH.config.hr.schema:CH.config.wow.wolib}.xxpuser WHERE USUSER = ?", [session.user?.id]) 
		println "password:"+rs.USPWD
		def password = rs.USPWD
		long now = System.currentTimeMillis() / 1000;
		now = now + 10 - (now % 5);
		def session1 = CoderUtility.getInstance().encode (new String (java.security.MessageDigest.getInstance("SHA-1").digest ("$password;$now".getBytes())))
		println 'redirect uri:'+'FromWOW/requisition/list?CALLING_USERID=hr&SESSION='+session1
//new Date().sleep(5000)
		redirect uri:'/FromWOW/requisition/list?CALLING_USERID=hr&SESSION='+session1+'&other=params'
   }

}
