package daffron.fms.hr.enrollment


import java.text.SimpleDateFormat;

import daffron.fms.hr.Address

import daffron.fms.hr.payroll.EmployeePayrollMaster
 
class PopulateFromCSVService {

    static transactional = true
/* change the GLE test data's data's emp nos of:
dayrl, veronicia, charity, shaun, anjanette
 
 to these:
hrixpgle
MSEMP	MSNAME	
1503	MADDUX,THERESA A.                       	
2907	PATRICK, JOHNNY LEE                     	
3004	SPINKS, KIRBY S.                        	
4408	ENGLE, JOE ALLEN                        	
5009	MC KNIGHT, DELBERT W.    

cudtahr:
MSEMP	MSNAME	
22264	BARTON, WILLIAM T                       	
22117	BLEIKER, JOHN                           	
22273	BOYD, LAWRENCE F                        	
22200	BRANSTETTER, FRANK                      	
22282	BREWSTER, BUTCH R                       	

*/
    def populate(String csvLoc) {
		boolean first = true
		def headers
		// "/work/customers/daffron/GLE Data for Carl 10-11.csv"
		new File(csvLoc).eachLine{line->
			if (first) {
				headers = line.split(/\|/)
				// double check match of column header names in codeMap and CSV
				headers.each {colHead ->
					if (!codeMap.find {it.key == colHead }) {
						println "$colHead not found in codeMap"
						assert false
					}
				}
				first = false
				return
			}
			
			def enrollMap = [:]
			line.split(/\|/).eachWithIndex {cell, i ->
				if (codeMap."${headers[i]}") {
					enrollMap."${headers[i]}" = cell
				}
			}

			// 'Member2' 'Rel2' 'DOB2' 'Gender2' 'SSN2' 'MedA2' 'MedB2' 'HIB2'
			def covered = []
			(0..7).each {i -> covered[i] = new CoveredCSV()}
			
			println "Processing employee number:"+enrollMap.EMP_NUMBER.toInteger()
			def emp = EmployeePayrollMaster.get(enrollMap.EMP_NUMBER.toInteger())
			assert emp
			def enroll = Enroll.findByEmployee(emp)

			enrollMap.each{colHead, colValue ->
				if (enroll) {
					if (!enroll.contact) {
						println "building contact for ${enroll.id}"
						def addr = new Address(line1:'', city:'', state:'MI', zip:'00000')
						enroll.contact = new Contact(addr:addr)
					}
					def colCmd = codeMap[colHead]
					if (integerCols.find { it == colHead.toString()}) {
						colValue = colValue.toInteger()
					} else if (dateCols.find { it == colHead.toString() } ) {
						colValue = java.sql.Date.parse('MM/dd/yyyy', colValue)
					} else if (colValue ==~ /^\$[\d,\.]*$/  ) {
						colValue = colValue.replaceAll(/\$|,/,'').toBigDecimal()
					} 
					
					Binding binding = new Binding()
					binding.setVariable("enroll", enroll)
					binding.setVariable("value", colValue)
					binding.setVariable("covered", covered)
					GroovyShell shell = new GroovyShell(binding)
					//println "running $colCmd with value $colValue"
					shell.evaluate(colCmd)
				}
			}
			if (enroll) {
				covered.eachWithIndex{cov, i ->
					if (i==0) return
					if (cov.Rel) {
						def rela = Covered.RELATIONSHIP_TYPES.find {k,v -> v.toLowerCase() == cov.Rel.toLowerCase()}?.getKey()
						if (!rela) {
							println "Relationship ${cov.Rel} not found in Covered.RELATIONSHIP_TYPES"
							assert false
						}
						Date dob = new SimpleDateFormat("MM/dd/yyyy").parse(cov.DOB)
						GregorianCalendar cal = new GregorianCalendar()
						cal.setTime(dob)
						def year =  cal.get(Calendar.YEAR)
						year = (year<30)?year+2000:year+1900
						cal.set(Calendar.YEAR, year)
						dob = cal.time
						def newCov = new Covered(
							type:'P', 
							name:cov.Member?:enroll.contact.firstName, 
							relationship:rela, 
							birth:dob,
							ssn:cov.SSN.replaceAll(/-/, '').toLong(),
							gender:cov.Gender?:enroll.contact.gender,
							share:0g
						)
						enroll.addToCovered(newCov)
					}
				}
				if (!enroll.save(flush:true)) enroll.errors.each{println it}
			}
	
		} // each line
		
    }

	def integerCols = ['EMP_NUMBER']
	def dateCols = ['D-O-B']
	def codeMap = [
		
		'LAST_NAME':'enroll.contact.lastName = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',
		'FIRST_NAME':'enroll.contact.firstName = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',
		'MI':'enroll.contact.mi = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',
		'EMP_NUMBER':"println 'not updating payroll master with the CSV employee number';",  
		'D-O-B':'println "dont do: enroll.employee.birthDate = value;  "',
		'WORK_SITE':'enroll.contact.workSite = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',   // add to contact info
		'STATUS':'enroll.contact.status = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',      // add to contact info
		'Union Status':'enroll.contact.unionStatus = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }', // add
		'ADDRESS':'enroll.contact.addr.line1 = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }', // add to contact HAVE line1 and line2
		'CITY':'enroll.contact.addr.city = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',
		'STATE':'enroll.contact.addr.state = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',
		'ZIP':'enroll.contact.addr.zip = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',
		'Marital Status':'enroll.contact.maritalStatus = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',
		'Emergency Contact':'enroll.contact.emergency1Name = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',
		'Day Phone':'enroll.contact.emergency1Phone1 = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',
		'Eve Phone':'enroll.contact.emergency1Phone2 = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',
		'SS_NUMBER':'enroll.contact.ssn = value.replaceAll(/-/,""); if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',
		'Home Phone Num':'enroll.contact.phone = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',
		
		'2011 URM Annual Election':"""enroll.cafeteria.populateMode = true
									  if (value.toString() == "waive") { enroll.cafeteria.urmWaive = true 
		                              } else { enroll.cafeteria.urmElectionPrior = value}
		                              if (! enroll.save(flush:true) ){enroll.errors.each{println it} }""",
		'2011 URM Per Pay':'enroll.cafeteria.urmDeductionPrior = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',
		'2011 DDC Annual Election':"""enroll.cafeteria.populateMode = true
								      if (value == "waive") { enroll.cafeteria.ddcWaive = true
		                              } else { enroll.cafeteria.ddcElection = value }
		                              if (! enroll.save(flush:true) ){enroll.errors.each{println it} }""",
		'2011 DDC Per Pay':'enroll.cafeteria.ddcDeductionPrior = value;enroll.cafeteria.populateMode = true; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',
		'2011 GLE Contribution DDC/URM or N/A':'if (value != "n/a") enroll.cafeteria.contribution = value; enroll.cafeteria.populateMode = true; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',
		'2011 reimbursement method':"""
			def code = enroll.cafeteria.FSA_REPAY_MAP.find{k,v -> v.toLowerCase() == value.toLowerCase()} 
		    enroll.cafeteria.fsaRepayMethod = code?.key?:'';enroll.cafeteria.populateMode = true;
		    if (! enroll.save(flush:true) ){enroll.errors.each{println it} }
		    """,
		'2011 URM Account Balance':'if (value.toString() != "waive") {enroll.cafeteria.urmBalancePrior = value; enroll.cafeteria.populateMode = true; if (! enroll.save(flush:true) ){enroll.errors.each{println it} } }',
		'2011 DDC Account Balance':'if (value.toString() != "waive") {enroll.cafeteria.ddcBalancePrior = value; enroll.cafeteria.populateMode = true; if (! enroll.save(flush:true) ){enroll.errors.each{println it} } }',
		
		'DD Account Type':""" 
              if (value != "n/a") {
				enroll.cafeteria.populateMode = true;
                def code = enroll.cafeteria.FSA_REPAY_ACC_TYPE.find{k,v -> v.toLowerCase() == value.toLowerCase()} 
		        enroll.cafeteria.fsaRepayActType = code?.key?:value;
                if (! enroll.save(flush:true) ){enroll.errors.each{println it} }
              }
		   """,
		
		// voluntary insurance tab:
		'Grandfathered Flat Rate EE,SP,CH Combined':null, // ignore
		
		'2011 Grandfathered Flat Rate EE Benefit': """
			def vi = enroll.voluntaryInsurance.find {it.name == 'flat_rate_life' && it.coveredPersonType == 'E'} 
			if (value == 'Waive') { vi.waive = true 
			} else { vi.benefit = value}
			; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }""",
		'2011 Grandfathered Flate Rate EE Cost':"enroll.voluntaryInsurance.find {it.name == 'flat_rate_life' && it.coveredPersonType == 'E'}.costPriorPerPay = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }",		
		'2011 Grandfathered Flat Rate SP Benefit':"""
			def vi = enroll.voluntaryInsurance.find {it.name == 'flat_rate_life' && it.coveredPersonType == 'D'} 
			if (value == 'Waive') { vi.waive = true  
			} else { vi.benefit = value}
			if (! enroll.save(flush:true) ){enroll.errors.each{println it} }""",		
		'2011 Grandfathered Flat Rate CH Benefit':"""println "2011 Grandfathered Flat Rate CH Benefit" +value+" "+enroll.contact.firstName;
			def vi = enroll.voluntaryInsurance.find {it.name == 'flat_rate_life' && it.coveredPersonType == 'D'} 
			if (value == 'Waive') { vi.waive = true 
			} else { vi.benefitExtra = value}
			if (!enroll.save(flush:true) ){enroll.errors.each{println it} }""",		
		'Combined Grandfathered Flat Rate SP& CH Benefit':null, // in benefit and benefit2
		'2011 Grandfathered Flat Rate SP/CH Cost':"enroll.voluntaryInsurance.find {it.name == 'flat_rate_life' && it.coveredPersonType == 'D'}.costPriorPerPay = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }",		
		
		'TOTAL Grandfathered Flat Rate EE/SP/CH Cost':null, // ignore its a total
		
		// Vol Ins Critical Illness (which is cancer)
		'2012 EE CI Cancer Cost':null,   // ignore
		
		'2011 CI EE Cancer Benefit':"""
			def vi = enroll.voluntaryInsurance.find {it.name == 'critical_illness' && it.coveredPersonType == 'E'} 
			if (value == 'Waive') { vi.waive = true 
			} else { vi.benefit = value}
			if (! enroll.save(flush:true) ){enroll.errors.each{println it} }""",		
		'2011 CI SP Cancer  Benefit':"""
			def vi = enroll.voluntaryInsurance.find {it.name == 'critical_illness' && it.coveredPersonType == 'S'} 
			if (value == 'Waive') { vi.waive = true
			} else { vi.benefit = value}
			if (! enroll.save(flush:true) ){enroll.errors.each{println it} }""",		
		'2011 CI CH Cancer Benefit':"""
			def vi = enroll.voluntaryInsurance.find {it.name == 'critical_illness' && it.coveredPersonType == 'C'} 
			if (value == 'Waive') { vi.waive = true 
			} else { vi.benefit = value}
			if (! enroll.save(flush:true) ){enroll.errors.each{println it} }""",		
		'2011 EE CI Cancer Cost':"def e = enroll.voluntaryInsurance.find {it.name == 'critical_illness' && it.coveredPersonType == 'E'}; e.costPriorPerPay = value; e.costPerPay = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }",
		'2011 CI SP Cancer Cost':"def e = enroll.voluntaryInsurance.find {it.name == 'critical_illness' && it.coveredPersonType == 'S'}; e.costPriorPerPay = value; e.costPerPay = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }",
		'2011 CI CH Cancer Cost':"def e = enroll.voluntaryInsurance.find {it.name == 'critical_illness' && it.coveredPersonType == 'C'}; e.costPriorPerPay = value; e.costPerPay = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }",		

		'TOTAL 2011 CI EE, SP, CH Cost':null, // ignore
		
		// 2011 CI EE COST
		// 2011 CI SP COST
		// 2011 CI CH COST
		//    note put in both 2011 and 2012 Per Pay column
		
		'2011 STD Benefit':"""
			def vi = enroll.voluntaryInsurance.find {it.name == 'standard' && it.coveredPersonType == 'U'} 
			if (value == 'n/a') { vi.notApplicable = true 
			} else { vi.benefit = value}
			if (! enroll.save(flush:true) ){enroll.errors.each{println it} }""",
		'2011 STD Cost':"if (value != 'n/a') {enroll.voluntaryInsurance.find {it.name == 'standard' && it.coveredPersonType == 'U'}.costPriorPerPay = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }}",		
		// vol ins Age Banded Voluntary Life/AD&D (leave AD&D, unlike Flat Rate)
		'2011 Age Banded EE Vol Life Benefit':"""
			def vi = enroll.voluntaryInsurance.find {it.name == 'age_banded_life' && it.coveredPersonType == 'E'} 
			if (value == 'Waive') { vi.waive = true
			} else { vi.benefit = value}
			if (! enroll.save(flush:true) ){enroll.errors.each{println it} }""",		
		'2011 Age Banded EE Vol Life Cost':"enroll.voluntaryInsurance.find {it.name == 'age_banded_life' && it.coveredPersonType == 'E'}.costPriorPerPay = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }",		
		'2012 Age Banded EE Vol Life Cost':"enroll.voluntaryInsurance.find {it.name == 'age_banded_life' && it.coveredPersonType == 'E'}.costPerPay = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }",
		'2011 Age Banded SP Vol Life Benefit':"""
			def vi = enroll.voluntaryInsurance.find {it.name == 'age_banded_life' && it.coveredPersonType == 'S'} 
			if (value == 'Waive') { vi.waive = true
			} else { vi.benefit = value}
			if (! enroll.save(flush:true) ){enroll.errors.each{println it} }""",		
		'2011 Age Banded SP Vol Life Cost':"enroll.voluntaryInsurance.find {it.name == 'age_banded_life' && it.coveredPersonType == 'S'}.costPriorPerPay = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }",		
		'2012 Age Banded SP Vol Life Cost':"enroll.voluntaryInsurance.find {it.name == 'age_banded_life' && it.coveredPersonType == 'S'}.costPerPay = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }",
		'2011 Age Banded CH Vol Life Benefit':"""
			def vi = enroll.voluntaryInsurance.find {it.name == 'age_banded_life' && it.coveredPersonType == 'C'} 
			if (value == 'Waive') { vi.waive = true;
			} else { vi.benefit = value}
			if (! enroll.save(flush:true) ){enroll.errors.each{println it} }""",		
		'2011 Age Banded CH Vol Life Cost':"enroll.voluntaryInsurance.find {it.name == 'age_banded_life' && it.coveredPersonType == 'C'}.costPriorPerPay = value;if (! enroll.save(flush:true) ){enroll.errors.each{println it} }",		
		'2012 Age Banded CH Vol Life Cost':"enroll.voluntaryInsurance.find {it.name == 'age_banded_life' && it.coveredPersonType == 'C'}.costPerPay = value;if (! enroll.save(flush:true) ){enroll.errors.each{println it} }",

		'TOTAL AGE BANDED':null, // ignore
		
		// ignore these...
		'Union without FR or STD':null,
		'Union with STD, no FR':null,
		'Union With FR Life & STD':null,
		'Union With FR, no STD':null,
		
		// Health Tab
		'2011 Plan Election':'enroll.planElectionPrior = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',  
		'2011 MDV Coverage':'enroll.mdvCoveragePrior = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',
		
		'Gender':'enroll.contact.gender = value; if (! enroll.save(flush:true) ){enroll.errors.each{println it} }',
		
		// medicare is under both Covered and Medicare
		'Rel1':'covered[1].Rel = value', // relationship, note subscriber is the employee
		'DOB1':'covered[1].DOB = value', // birth date
		'SSN1':'covered[1].SSN = value',
		'MedA1':'covered[1].MedA = value', // policy number
		'MedB1':'covered[1].MedB = value', // ignore
		'HIB1':'covered[1].HIB = value',  // ignore
		'Member2':'covered[2].Member = value',
		'Rel2':'covered[2].Rel = value',
		'DOB2':'covered[2].DOB = value',
		'Gender2':'covered[2].Gender = value',
		'SSN2':'covered[2].SSN = value',
		'MedA2':'covered[2].MedA = value',
		'MedB2':'covered[2].MedB = value',
		'HIB2':'covered[2].HIB = value',
		'Member3':'covered[3].Member = value',
		'Rel3':'covered[3].Rel = value',
		'DOB3':'covered[3].DOB = value',
		'Gender3':'covered[3].Gender = value',
		'SSN3':'covered[3].SSN = value',
		'MedA3':'covered[3].MedA = value',
		'MedB3':'covered[3].MedB = value',
		'HIB3':'covered[3].HIB = value',
		'Member4':'covered[4].Member = value',
		'Rel4':'covered[4].Rel = value',
		'DOB4':'covered[4].DOB = value',
		'Gender4':'covered[4].Gender = value',
		'SSN4':'covered[4].SSN = value',
		'MedA4':'covered[4].MedA = value',
		'MedB4':'covered[4].MedB = value',
		'HIB4':'covered[4].HIB = value',
		'Member5':'covered[5].Member = value',
		'Rel5':'covered[5].Rel = value',
		'DOB5':'covered[5].DOB = value',
		'Gender5':'covered[5].Gender = value',
		'SSN5':'covered[5].SSN = value',
		'MedA5':'covered[5].MedA = value',
		'MedB5':'covered[5].MedB = value',
		'HIB5':'covered[5].HIB = value',
		'Member6':'covered[6].Member = value',
		'Rel6':'covered[6].Rel = value',
		'DOB6':'covered[6].DOB = value',
		'Gender6':'covered[6].Gender = value',
		'SSN6':'covered[6].SSN = value',
		'MedA6':'covered[6].MedA = value',
		'MedB6':'covered[6].MedB = value',
		'HIB6':'covered[6].HIB = value',
		'Member7':'covered[7].Member = value',
		'Rel7':'covered[7].Rel = value',
		'DOB7':'covered[7].DOB = value',
		'Gender7':'covered[7].Gender = value',
		'SSN7':'covered[7].SSN = value',
		'MedA7':'covered[7].MedA = value',
		'MedB7':'covered[7].MedB = value',
		'HIB7':'covered[7].HIB = value'	
		]
}
class CoveredCSV {
	String Member
	String Rel
	String DOB
	String Gender
	String SSN
	String MedA
	String MedB
	String HIB
	String toString() {"$Member $Rel $DOB $Gender $SSN $MedA $MedB $HIB"}
}


