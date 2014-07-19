
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <r:require module="common"/>
        <g:set var="entityName" value="${message(code: 'covered.label', default: 'Covered')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <link href="${createLinkTo(dir: 'css', file: 'enrollment.css')}" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="nav">
            <dt><span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <dt><span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <dt><span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${coveredInstance}">
            <div class="errors">
                <g:renderErrors bean="${coveredInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${coveredInstance?.id}" />
                <g:hiddenField name="version" value="${coveredInstance?.version}" />
                <div class="dialog">
                	<dl>
		                 <dt><label for="relationship"><g:message code="covered.relationship.label" default="Relationship" /></label></dt>
		                 <dd><span class="value ${hasErrors(bean: coveredInstance, field: 'relationship', 'errors')}">
		                     <g:select name="relationship" from="${coveredInstance.constraints.relationship.inList}" value="${coveredInstance?.relationship}" valueMessagePrefix="covered.relationship" noSelection="['': '']" />
		                     </span>
		                 </dd>
		                 <dt><label for="gender"><g:message code="covered.gender.label" default="Gender" /></label></dt>
		                 <dt><span class="value ${hasErrors(bean: coveredInstance, field: 'gender', 'errors')}">
		                     <g:select name="gender" from="${coveredInstance.constraints.gender.inList}" value="${coveredInstance?.gender}" valueMessagePrefix="covered.gender"  />
		                     </span>
		                 </dd>
		                 <dt><label for="birth"><g:message code="covered.birth.label" default="Birth" /></label></dt>
		                 <dd><span class="value ${hasErrors(bean: coveredInstance, field: 'birth', 'errors')}">
		                     <g:datePicker name="birth" precision="day" value="${coveredInstance?.birth}"  />
		                     </span>
		                 </dd>
		                 <dt><label for="enroll"><g:message code="covered.enroll.label" default="Enroll" /></label></dt>
		                 <dd><span class="value ${hasErrors(bean: coveredInstance, field: 'enroll', 'errors')}">
		                     <g:select name="enroll.id" from="${Enroll.list()}" optionKey="id" value="${coveredInstance?.enroll?.id}"  />
		                     </span>
		                 </dd>
		         
		                 <dt><label for="name"><g:message code="covered.name.label" default="Name" /></label></dt>
		                 <dd><span class="value ${hasErrors(bean: coveredInstance, field: 'name', 'errors')}">
		                     <g:textField name="name" value="${coveredInstance?.name}" />
		                     </span>
		                 </dd>
		
		                 <dt><label for="ssn"><g:message code="covered.ssn.label" default="Ssn" /></label></dt>
		                 <dd><span class="value ${hasErrors(bean: coveredInstance, field: 'ssn', 'errors')}">
		                     <g:textField name="ssn" value="${fieldValue(bean: coveredInstance, field: 'ssn')}" />
		                     </span>
		                 </dd>
	                 </dl>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
