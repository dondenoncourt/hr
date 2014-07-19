[
'LAST_NAME':'enroll.contact.lastName',
'FIRST_NAME':'enroll.contact.firstName',
'MI':'enroll.contact.mi',
'EMP_NUMBER':'enroll.employee.id',
'D-O-B':'enroll.employee.birthDate',
'WORK_SITE':'enroll.contact.workSite',   // add to contact info
'STATUS':'enroll.contact.workSite',      // add to contact info 
'Union Status':'enroll.contact.workSite', // add 
'ADDRESS':'enroll.contact.addr.line1', // add to contact HAVE line1 and line2 
'CITY':'enroll.contact.addr.city',
'STATE':'enroll.contact.addr.state',
'ZIP':'enroll.contact.addr.zip',
'Marital Status':'enroll.employee.maritalStatus',
'Emergency Contact':'enroll.contact.emergency1Name',
'Day Phone':'enroll.contact.emergency1Phone1',
'Eve Phone':'enroll.contact.emergency1Phone2',
'SS_NUMBER':'enroll.contact.ssn',
'Home Phone Num':'enroll.contact.phone',

'2011 URM Annual Election':'enroll.cafeteria.urmElectionPrior',
'2011 URM Per Pay':'enroll.cafeteria.urmDeduction',
'2011 DDC Annual Election':'enroll.cafeteria.ddcBalancePrior',
'2011 DDC Per Pay':'enroll.cafeteria.ddcDeductionPrior',
'2011 GLE Contribution DDC/URM or N/A':'enroll.cafeteria.contribution',
'2011 reimbursement method':'enroll.cafeteria.fsaRepayMethod',
// Anjanette to add:
// '2011 URM Account Balance':'enroll.cafeteria.urmBalancePrior
// '2011 DDC Account Balance':'enroll.cafeteria.ddcBalancePrior
// Note move flex spend Waive Coverage checkbox to over the 2012 input columns....
'DD Account Type':'enroll.cafeteria.fasRepayActType',

// voluntary insurance tab:
// change age banded and Flat rate Per Pay to Per Month

// grandfathered is Flat Rage Voluntary Live AD&D on bottom only Remove Change radio, 
    // if click cancel popup warning that you can't reinroll at a later time
    // combine Spouse & CHildren to one : Dependents 
    // Employee: $10,000
    // if all waive, don't show section at all
    // remove /AD&D after Flat Rate Volutary Life
    
'Grandfathered Flat Rate EE,SP,CH Combined':null, // ignore 

'2011 Grandfathered Flat Rate EE Benefit': bene',
'2011 Grandfathered Flate Rate EE Cost': cost',
enroll.addToVoluntaryInsurance(new VoluntaryInsurance(name:'flat_rate_life',coveredPersonType:'E', benefit:bene, costPriorPerPay:cost)
'2011 Grandfathered Flat Rate SP Benefit':bene',
'2011 Grandfathered Flat Rate CH Benefit':bene2',
'Combined Grandfathered Flat Rate SP& CH Benefit':bene',
'2011 Grandfathered Flat Rate SP/CH Cost':cost',
enroll.addToVoluntaryInsurance(new VoluntaryInsurance(name:'flat_rate_life',coveredPersonType:'D', benefit:bene, benefitExtra:ben2 costPriorPerPay:cost)

'TOTAL Grandfathered Flat Rate EE/SP/CH Cost':null, // ignore its a total

// Vol Ins Critical Illness (which is cancer)
  // Cost columns read-only
  // if click change prompt "HR will arrange a meeting with UNUM representative"
'2012 EE CI Cancer Cost':null,   // ignore

// spreadsheet does not have cost for CI, Anjanette will add
'2011 CI EE Cancer Benefit':bene',
'2011 CI EE Cancer Cost':cost',
enroll.addToVoluntaryInsurance(new VoluntaryInsurance(name:'critical_illness',coveredPersonType:'E', benefit:bene, costPriorPerPay:cost)
'2011 CI SP Cancer  Benefit':bene',
'2011 CI SP Cancer  Cost':cost',
enroll.addToVoluntaryInsurance(new VoluntaryInsurance(name:'critical_illness',coveredPersonType:'S', benefit:bene, costPriorPerPay:cost)
'2011 CI CH Cancer Benefit':bene',
'2011 CI CH Cancer Cost':cost',
enroll.addToVoluntaryInsurance(new VoluntaryInsurance(name:'critical_illness',coveredPersonType:'C', benefit:bene, costPriorPerPay:cost)
// W H E R E   A R E   T H E   2 0 1 2  C O S T S ?  

'TOTAL 2011 CI EE, SP, CH Cost':null, // ignore 

// 2011 CI EE COST 
// 2011 CI SP COST
// 2011 CI CH COST
//    note put in both 2011 and 2012 Per Pay column

// union only, should be on page if Union employee
'2011 STD Benefit':bene',
'2011 STD Cost':cost',
enroll.addToVoluntaryInsurance(new VoluntaryInsurance(name:'standard',coveredPersonType:'E', benefit:bene, costPriorPerPay:cost)


// vol ins Age Banded Voluntary Life/AD&D (leave AD&D, unlike Flat Rate)
// change Aged to Age
// change Per Pay to Per Month
// 2011 and 2012 read-only costs 
// add a prompt for HR meeting on click of change
'2011 Age Banded EE Vol Life Benefit':bene',
'2011 Age Banded EE Vol Life Cost':cost',
enroll.addToVoluntaryInsurance(new VoluntaryInsurance(name:'age_banded_life',coveredPersonType:'E', benefit:bene, costPriorPerPay:cost)
'2011 Age Banded SP Vol Life Benefit':bene, 
'2011 Age Banded SP Vol Life Cost':cost',
enroll.addToVoluntaryInsurance(new VoluntaryInsurance(name:'age_banded_life',coveredPersonType:'S', benefit:bene, costPriorPerPay:cost)
'2011 Age Banded CH Vol Life Benefit':bene',
'2011 Age Banded CH Vol Life Cost':cost',
enroll.addToVoluntaryInsurance(new VoluntaryInsurance(name:'age_banded_life',coveredPersonType:'C', benefit:bene, costPriorPerPay:cost)

'TOTAL AGE BANDED':null, // ignore 

// ignore these...
'Union without FR or STD':null,
'Union with STD, no FR':null,
'Union With FR Life & STD':null,
'Union With FR, no STD':null,

// Health Tab
// use another fieldset with the title '2011 Plan Elections' 
// should show at the top of the page 
// Your current election is ${2011 Plan Election}
// Your current coverage is ${2011 MDV Coverage}
// Anjanette to add:
// '2011 Plan Election': enroll.planElectionPrior',
'2011 MDV Coverage':'enroll.mdvCoveragePrior, 

'Gender':null,

// medicare is under both Covered and Medicare 
// if medicare be sure name is on the covered so add validation
// for the subscriber, if medicare, use first name from the begining of the xls
'Rel1':null, // relationship, note subscriber is the employee...
'DOB1':null, // birth date 
'SSN1':null,
'MedA1':null, // policy number
'MedB1':null, // ignore 
'HIB1':null,  // ignore 
'Member2':null,
'Rel2':null,
'DOB2':null,
'Gender2':null,
'SSN2':null,
'MedA2':null,
'MedB2':null,
'HIB2':null,
'Member3':null,
'Rel3':null,
'DOB3':null,
'Gender3':null,
'SSN3':null,
'MedA3':null,
'MedB3':null,
'HIB3':null,
'Member4':null,
'Rel4':null,
'DOB4':null,
'Gender4':null,
'SSN4':null,
'MedA4':null,
'MedB4':null,
'HIB4':null,
'Member5':null,
'Rel5':null,
'DOB5':null,
'Gender5':null,
'SSN5':null,
'MedA5':null,
'MedB5':null,
'HIB5':null,
'Member6':null,
'Rel6':null,
'DOB6':null,
'Gender6':null,
'SSN6':null,
'MedA6':null,
'MedB6':null,
'HIB6':null,
'Member7':null,
'Rel7':null,
'DOB7':null,
'Gender7':null,
'SSN7':null,
'MedA7':null,
'MedB7':null,
'HIB7':null
]
boolean first = true
def headers
new File("/work/customers/daffron/GLE Data for Carl 10-11.csv").eachLine{line-> 
	if (first) {
		headers = line.split(/\|/)
		first = false
		return
	} 
	line.split(/\|/).eachWithIndex {cell, i ->
		println  "${headers[i]}: $cell"
	}
}
headers.each{println it}
println headers.size()

