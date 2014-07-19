package daffron.fms.hr.enrollment

import daffron.fms.hr.Address
import daffron.fms.hr.payroll.EmployeePayrollMaster;
import daffron.fms.hr.enrollment.Enroll;


public class EnrollService {
	void initEnrollment () {
		Enroll.list()*.delete()
		EmployeePayrollMaster.list().each {pay ->
			def enroll = new Enroll(employee:pay)
			def addr = new Address(line1:'invalid', city:'invalid', state:'MI', zip:'00000')
			enroll.contact = new Contact(addr:addr)
			enroll.cafeteria = new Cafeteria()
			enroll.addToVoluntaryInsurance(new VoluntaryInsurance(name:'flat_rate_life',coveredPersonType:'E'))
			enroll.addToVoluntaryInsurance(new VoluntaryInsurance(name:'flat_rate_life',coveredPersonType:'D'))
			enroll.addToVoluntaryInsurance(new VoluntaryInsurance(name:'critical_illness',coveredPersonType:'E'))
			enroll.addToVoluntaryInsurance(new VoluntaryInsurance(name:'critical_illness',coveredPersonType:'S'))
			enroll.addToVoluntaryInsurance(new VoluntaryInsurance(name:'critical_illness',coveredPersonType:'C'))
			enroll.addToVoluntaryInsurance(new VoluntaryInsurance(name:'age_banded_life',coveredPersonType:'E'))
			enroll.addToVoluntaryInsurance(new VoluntaryInsurance(name:'age_banded_life',coveredPersonType:'S'))
			enroll.addToVoluntaryInsurance(new VoluntaryInsurance(name:'age_banded_life',coveredPersonType:'C'))
			enroll.addToVoluntaryInsurance(new VoluntaryInsurance(name:'standard',coveredPersonType:'U'))
            if (!enroll.save(flush:true)) {
				enroll.errors.each { println it }
				assert false
			}
		}
	}
}
