import org.springframework.beans.BeanWrapper
import org.springframework.beans.PropertyAccessorFactory
import daffron.fms.hr.recruiting.*

// see http://www.intelligrape.com/blog/tag/groovy-annotation/
def data = []
for (controller in grailsApplication.controllerClasses) {
    def controllerInfo = [:]
    controllerInfo.controller = controller.logicalPropertyName
    controllerInfo.controllerName = controller.fullName
    List actions = []
    BeanWrapper beanWrapper = PropertyAccessorFactory.forBeanPropertyAccess(controller.newInstance())
    for (pd in beanWrapper.propertyDescriptors) {
        String closureClassName = controller.getPropertyOrStaticPropertyOrFieldValue(pd.name, Closure)?.class?.name
        if (closureClassName) {
            actions << pd.name
            def action = controller.clazz.declaredFields.find { field -> field.name == pd.name }
            def annotation = action.getAnnotation(daffron.fms.hr.AuthorizeOperation)
            if (annotation) {
                println "${pd.name} action.annotation:"+annotation
            }
        }
    }
    controllerInfo.actions = actions.sort()
    data << controllerInfo
}
println data

def cc = grailsApplication.controllerClasses.find {it.logicalPropertyName =~ 'requisition'}
println "controller:"+cc 
def action = cc.clazz.declaredFields.find { field -> field.name == 'approve' }
println "action:"+action
println "action.annotation:"+action.getAnnotation(daffron.fms.hr.AuthorizeOperation)
