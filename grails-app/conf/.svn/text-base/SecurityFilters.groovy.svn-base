import daffron.fms.AuthorizedUserOperations
import daffron.fms.AuthorizedOperations
import daffron.fms.hr.AuthorizeOperation

class SecurityFilters {
	def filters = {
		secure(controller:'*') {
			before = {
				if (controllerName && !params.pdf) {
					def controller = grailsApplication.controllerClasses.find {it.logicalPropertyName =~ controllerName}
					def action = controller.clazz.declaredFields.find { field -> field.name == actionName }
					if (!action) {
						try {
							action = controller?.clazz?.getMethod(actionName, [] as Class[])
						} catch (ex) { log.debug ex /* or otherwise ignore */ }
					}
					def annotation = action?.getAnnotation(daffron.fms.hr.AuthorizeOperation)
					if (annotation) {
						if (session?.user?.hrSecurityLevel?:0 < (annotation.level() as int)) {
							def authOp = AuthorizedOperations.findByControllerAndAction(controllerName, actionName)
							def authUserOp = AuthorizedUserOperations.findByAuthorityOperationId(authOp?.authorityOperationId?:0)
							if (authUserOp && !authUserOp?.give) {
								flash.message = "Your HR security level does not allow you to access  uri:${controllerName}/${actionName} desc:${annotation.text()}"
								redirect(controller:"login", action:"home")
								return false
							}
						}
					}
				}
			}
		}
	}
}
