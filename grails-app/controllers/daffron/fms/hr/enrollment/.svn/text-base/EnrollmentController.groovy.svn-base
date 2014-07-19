package daffron.fms.hr.enrollment
import daffron.fms.hr.payroll.EmployeePayrollMaster;

class EnrollmentController {
	def beforeInterceptor = {
		println "action: $actionName params: $params flash: $flash"
	}

    def index = { redirect(action:list,params:params) }
    static def allowedMethods = [delete:'POST', save:'POST', update:'POST']
    def list = {
        if(!params.max) params.max = 10
        [ employeePayrollMasterInstanceList: EmployeePayrollMaster.list( params ) ]
    }
    def show = {
        return [ employeePayrollMasterInstance : getEmployeePayrollMaster(params) ]
    }
    private String getKey(def employeePayrollMaster) {
    		return employeePayrollMaster.id
	}
    private EmployeePayrollMaster getEmployeePayrollMaster(params) {
    		return EmployeePayrollMaster.get(params.id as java.lang.Integer )
    }
}
