
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

            <g:if test="${flash.message}">
	            <div class="general msg">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${enroll}">
	            <div class="errors msg">
	                <g:renderErrors bean="${enroll}" as="list" />
	            </div>
            </g:hasErrors>
            <div>
            </div>
		    <g:form action="update" method="post" name="enrollmentForm" >
                <g:hiddenField name="id" value="${enroll?.id}" />
                <g:hiddenField name="version" id="enrollId" value="${enroll?.version}" />
                <g:hiddenField name="view" value="fsaEdit" />
                <g:hiddenField name="changed" />
					<g:render template="cafeteriaEdit" model="[cafeteria:enroll?.cafeteria]" />
					<g:submitButton name="update" class="nextBtn" id="pageUpdateButton" value="Confirm and Next" title="Click to update Flexible Spending Account information and continue to next tab"/>			
		     </g:form>
          
		</div>
<g:javascript>
	enrollConfirmToUpdateSubmitText();
	$('#pageUpdateButton').click(function () {
	   if (!$('input[alias=urmWaive]' && 'input[alias=ddcWaive]').is(':checked')) {
		if (!$('input[alias=fsaRepayMethod]').is(':checked')) {
			alert('Please select a reimbursement method');
			return false;
		}
	   }
	});
</g:javascript>
</body>
</html>
