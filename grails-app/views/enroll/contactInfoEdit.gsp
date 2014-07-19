<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="enrollTab" />
        <link href="${createLinkTo(dir: 'css', file: 'enrollment.css')}" rel="stylesheet" type="text/css"/>
        <r:require module="common"/>
        <g:set var="entityName" value="${message(code: 'enroll.label', default: 'Enroll')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
      
    </head>
    
    <body<g:if test="${confirmPage}">onload="toggleFormElements()"</g:if>>          
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
	            <g:hiddenField name="version" value="${enroll?.version}" />
	            <g:if test="${!confirmPage}">
	            	<g:hiddenField name="view" value="contactInfoEdit" />
	            </g:if>
				<g:render template="contactInfoEdit" model="[enroll:enroll]"></g:render>          
          	
				<g:submitButton class="nextBtn" name="update" id="pageUpdateButton" value="Confirm and Next" title="Click to update Contact information and continue to next tab"/>
	        </g:form>
		</div>		
				
		<g:javascript>
		function showHideContactInfo() {
	    	 if ($('#noContactInfoChanges').is(':checked')) {
	    	 	$('#contactInfo').hide();
	    	 } else {
	    	 	$('#contactInfo').show();
	    	 }
	    }
	   	showHideContactInfo();
	   	enrollConfirmToUpdateSubmitText();
	    $('#noContactInfoChanges').click(function() {
	    	showHideContactInfo();
	    });
	    </g:javascript>
	</body>
</html>
