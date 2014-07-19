
class LoginFilters {
	def filters = {
		notPDF(controller:'*') {
			before = {
				println "$controllerName $actionName"
				if (!params.pdf && // pdf feature adds this parameter
					actionName != 'login' && 
					actionName != 'authenticate' && 
					!(controllerName == 'refreshStatic') &&
					!(controllerName == 'feeds') &&
					!(controllerName == 'user') &&
					!(controllerName == 'singleSignon') &&
					!(controllerName == 'candidate' && ['create', 'show', 'edit', 'save', 'update'].find{it == actionName}) &&
					!session?.user) {
					request.session.preLoginURI = request.forwardURI.replaceFirst(/\/\w*/, "")
					if (request.queryString?.size()) {
						request.session.preLoginURI += '?'+request.queryString
					}
					println "LoginFilters: preLoginURI:"+request.session.preLoginURI
					flash.message = "Please log in"
					redirect(controller:"login", action:"login")
					return false
				}
			}
		}
	}
}
