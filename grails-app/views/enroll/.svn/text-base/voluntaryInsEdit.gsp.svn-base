
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
			<g:if test="${!confirmPage}">
		    	<form action="${createLink(action:'saveVolIns')}" method="post" name="volInsForm" >
		    </g:if>
                <g:hiddenField name="id" value="${enroll?.id}" />
                <g:hiddenField name="version" id="enrollId" value="${enroll?.version}" />
                <g:hiddenField name="view" value="voluntaryInsEdit" />
           
				<fieldset id="voluntaryInsuranceFieldSet">
				<legend>Voluntary Insurance</legend>					
					<g:render template="voluntaryInsurance" model="[enroll:enroll]" />
				</fieldset>
								
				<g:if test="${!confirmPage}">
					<g:submitButton name="saveVolIns" value="Confirm and Next" class="nextBtn" title="Click to update Voluntary Insurance information and continue to next tab"/>
			     </form>
			    </g:if>
          
		</div>
				
<g:if test="${!confirmPage}">
<g:javascript>
	$('#pageUpdateButton').click(function () {
		  $('#enrollmentForm').submit();
	});
	  
	$('input[type=radio][value=N]').click(function () {
		 alert('Human Resources will arrange a meeting with the insurance provider.');
	});
</g:javascript>
</g:if>    
</body>
</html>
