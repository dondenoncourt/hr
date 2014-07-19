import grails.util.Environment
import daffron.fms.hr.recruiting.StatusService

class BootStrap {

    def init = { servletContext ->
		StatusService.loadStatusRules()
		
     	if (Environment.current == Environment.DEVELOPMENT) { 
     	}
    }
    def destroy = {
    }
}
