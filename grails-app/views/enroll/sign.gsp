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
	    	<g:form action="verifySignature" method="post" >
	    		<g:hiddenField name="id" value="${enroll?.id}" />
	            <g:hiddenField name="version" id="enrollId" value="${enroll?.version}" />
		   		<g:if test="${flash.message}">
		        	<div class="errors msg">${flash.message}</div>
		        </g:if>
		            <g:render template="sign" model="[enroll:enroll]" />
		        <div class="clear"></div>
		        <div class="content">
		          <div class="buttons linkBtns">
		              <g:submitButton name="Submit" class="approve button" value="Submit"/>
	                </div>
		        </div>		        
	        </g:form>
        </div>
	</body>
</html>
