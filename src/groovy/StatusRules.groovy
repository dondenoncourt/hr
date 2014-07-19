/*GLE workflow for testing in development environment*/
NEW_activity = {
	sendMail {
		to approverEmails
		cc "stephanie@daffron.com"
		from "jobs@daffron.com"
		subject "New Requisition Created That Needs Approval: Requisition No: ${requisition.id}"
		/* """ is multi line for groovy */
		body """
Please visit ${getEditLink()} and approve the requisition.   
		"""
	}
	nextStatus('APPROVE')	
}
APPROVE_activity = {
	if (approved) {
		if (jobDChanged) {
			nextStatus('JOBDMOD') 
		} else {
			nextStatus('PREPOSTING') 
		}
		sendMail {
			to "stephanie@daffron.com"
			from "jobs@daffron.com"
			subject "Requisition ${requisition.id} Has Been Approved"
			body """
		Line 1
		Line 2
		"""
		}
	} else {
		statusRulesError("Note: requistion ${id} not completely approved yet as not all of the authorized approvers have OKed it.")
	}
}
JOBDMOD_activity = {
	if (!jobDChanged) {
		nextStatus('PREPOSTING') 
	}
}

PREPOSTING_activity = {
	if (internalPosted) {
		nextStatus('IPOSTED')
	} else {
		statusRulesError("Status stayed in PREPOSTING as internal posting has not be completed.")
	}
}
IPOSTED_activity = {
	if (filtered) {
		nextStatus('HRSELECT')
	} else if (externalPosted) {
		nextStatus('XPOSTED')
	}
}
XPOSTED_activity = {
	if (filtered) {
		nextStatus('HRSELECT')
	} else {
		statusRulesError("Status stayed in XPOSTED as no candidates have been selected/filtered.")
	}
}
HRSELECT_activity = {
	if (hrFiltered) {
		nextStatus('SUPERSELECT')
	} else {
		statusRulesError("Status stayed in HRSELECT as no candidates have been selected/filtered.")
	}
}
SUPERSELECT_activity = {
	if (superFiltered) {
		nextStatus('PRECONTACT')
	} else {
		statusRulesError("Status stayed in SUPERSELECT as no candidates have been selected/filtered.")
	}
}
PRECONTACT_activity = {
	if (allContactedForTesting) {
		nextStatus('TESTING')
	} else {
		 statusRulesError("Status not changed as not all candidates have been contacted for testing.")
	}
}
TESTING_activity = {
	if (allTestScoresIn) {
		nextStatus('PICK')
	} else {
		 statusRulesError("Status stayed in TESTING as not all candidates test scores are in.")
	}
}
PICK_activity = {
	nextStatus('SINTD')
}
SINTD_activity = {
	if (allContactedForInterview) {
		nextStatus('INTERVIEW')
	} else {
		statusRulesError("Status stayed in SINTD as not all candidates have been contacted for interview.")
	}
}
INTERVIEW_activity = {
	if (allBackgroundChecksInitiated) {
		nextStatus('BCKGRDCHK')
	} else {
		statusRulesError("Status stayed in INTERVIEW as all background checks have not be initiated.")
	}
}
BCKGRDCHK_activity = {
	if (allBackgroundChecksComplete) {
		nextStatus('OFFERDRUG')
	} else {
		statusRulesError("Status stayed in BCKGRDCHK as background checks have not been completed.")
	}
}
OFFERDRUG_activity = {
	if (allDrugTestsComplete && allStartDatesSet) {
		nextStatus('SUPERSIGNHIRE')
	} else {
		statusRulesError("Status stayed in OFFERDRUG as all drug tests and start dates have not be set.")
	}
}
SUPERSIGNHIRE_activity = {
	if (approvedForHire) {
		nextStatus('NEWHIRE')
	}
}
