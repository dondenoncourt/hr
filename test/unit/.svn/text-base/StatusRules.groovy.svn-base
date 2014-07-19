/*DAFFRON workflow*/
NEW_activity = {
	if (jobDChanged) {
		nextStatus('JOBDMOD') 
	} else {
		nextStatus('PREPOSTING') 
	}
}
JOBDMOD_activity = {
	if (jobDChanged == false) {
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
		sendAuthenticatedMail {
			to candidateEmails
			from "jobs@daffron.com"
			subject "Daffron job questionaire for ${requisition}"
			body jobD.emailQuiz
		}
		nextStatus('PRESCREEN') 
	} else {
		statusRulesError("Status stayed in HRSELECT as no candidates have been selected/filtered by HR.")
	}
}
PRESCREEN_activity = {
	if (allEmailQuizRepliesIn) {
		 nextStatus('PHONEINTV') 
	} else {
		statusRulesError("Status stayed in PRESCREEN as not all email questionaires have been received.")
	}
}
PHONEINTV_activity = {
	if (allPhoneInterviewsComplete) {
		 nextStatus('SUPERSELECT') 
	} else {
		statusRulesError("Status stayed in PHONEINTV as the phone interviews are not yet complete.")
	}
}
SUPERSELECT_activity = {
	if (superFiltered) {
		nextStatus('SINTD')
	} else {
		statusRulesError("Status stayed in SUPERSELECT as none of the candidates were ranked.")
	}
}
SINTD_activity = {
	if (allContactedForInterview) {
		nextStatus('INTERVIEW')
		sendAuthenticatedMail {
			to interviewTeamEmails
			from "jobs@daffron.com"
			subject "Job interview for ${requisition} scheduled for ${interview}"
			body "Job interview for ${requisition} scheduled for ${interview}"
		}
	} else {
		statusRulesError("Status stayed in SINTD as not all candidates have been contacted for interview.")
	}
}
INTERVIEW_activity = {
	if (allBackgroundChecksInitiated) {
		nextStatus('PRECONTACT')
	} else {
		statusRulesError("Status stayed in INTERVIEW as all background checks have not be initiated.")
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
	 nextStatus('BCKGRDCHK')
}
BCKGRDCHK_activity = {
	if (allBackgroundChecksComplete) {
		 nextStatus('DRUG')
	} else {
		statusRulesError("Status stayed in BCKGRDCHK as background checks have not been completed.")
	}
}
DRUG_activity = {
	if (allDrugTestsComplete) {
		nextStatus('OFFER')
	} else {
		statusRulesError("Status stayed in DRUG as drug tests have not been completed.")
	}
}
OFFER_activity = {
	if (offerAccepted) {
		nextStatus('SUPERSIGNHIRE')
	} else {
		statusRulesError("Status stayed in OFFER as no candidate has accepted an offer.")
	}
}
SUPERSIGNHIRE_activity = {
	if (approvedForHire) {
		 nextStatus('NEWHIRE')
	}
}
