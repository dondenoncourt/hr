<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="enrollTab" />
        <link href="${createLinkTo(dir: 'css', file: 'enrollment.css')}" rel="stylesheet" type="text/css"/>
        <r:require module="common"/>
        <g:set var="entityName" value="${message(code: 'enroll.label', default: 'Enroll')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>      
    </head>   
       
    <body>
        <div class="enrollContent">
            <div class="content">
				<h1>Enrollment Summary</h1> 
	            <g:if test="${flash.message}">
		            <div class="message">${flash.message}</div>
	            </g:if>
	            <g:hasErrors bean="${enroll}">
		            <div class="errors">
		                <g:renderErrors bean="${enroll}" as="list" />
		            </div>
	            </g:hasErrors>
	        	<g:hiddenField name="view" value="completeEnrollmentEdit" /><!-- here just for tab coloring -->
	            <table>
		       		<tr>
			      		<td> 
			      			<g:link action="sign" id="${enroll.id}" class="std">Submit</g:link>
			       			<g:if test="${enroll.contactInfoSet && enroll.beneficiariesSet && enroll.fsaSet && enroll.voluntaryInsSet && enroll.healthPlanSet}">
								<h1>You have completed your enrollment</h1> 
				      			Click 			      			 
				      			to confirm your enrollment <br/> 
				      		</g:if>
				      		<g:else>
					      		You have not yet confirmed or updated your 
					      		<g:if test="${!enroll.contactInfoSet}">
				       				contact information. Please click the Contact Info tab,
					      		</g:if>
					      		<g:elseif test="${!enroll.healthPlanSet}">
				       				health plan information. Please click the Health Plan tab,
					      		</g:elseif>
					      		<g:elseif test="${!enroll.fsaSet}">
				       				flexible spending information. Please click the Flex Spending (FSA) tab,
					      		</g:elseif>
					      		<g:elseif test="${!enroll.voluntaryInsSet}">
				       				voluntary insurance information. Please click the Voluntary Insurance tab,
					      		</g:elseif>
					      		<g:elseif test="${!enroll.beneficiariesSet}">
				       				beneficiary information. Please click the Beneficiary Info tab,
					      		</g:elseif>
					      		review your information, and click the Confirm and Next button. 
				      		</g:else>
			      		</td>
			      	</tr>
			      	<tr>
			      		<td> Click <g:link action="confirm" id="${enroll.id}" class="std">Review</g:link> to view and print your enrollment </td>
		      		</tr>
	      		</table>
      		</div>
        </div>
  </body>
</html>
