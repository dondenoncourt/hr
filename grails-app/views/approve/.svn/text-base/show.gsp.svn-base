
<%@ page import="daffron.fms.hr.recruiting.Approve" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'approve.label', default: 'Approve')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-approve" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-approve" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list approve">
			
				<g:if test="${approveInstance?.employeeId}">
				<li class="fieldcontain">
					<span id="employeeId-label" class="property-label"><g:message code="approve.employeeId.label" default="Employee Id" /></span>
					
						<span class="property-value" aria-labelledby="employeeId-label"><g:fieldValue bean="${approveInstance}" field="employeeId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${approveInstance?.jobClassId}">
				<li class="fieldcontain">
					<span id="jobClassId-label" class="property-label"><g:message code="approve.jobClassId.label" default="Job Class Id" /></span>
					
						<span class="property-value" aria-labelledby="jobClassId-label"><g:fieldValue bean="${approveInstance}" field="jobClassId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${approveInstance?.mustOk}">
				<li class="fieldcontain">
					<span id="mustOk-label" class="property-label"><g:message code="approve.mustOk.label" default="Must Ok" /></span>
					
						<span class="property-value" aria-labelledby="mustOk-label"><g:formatBoolean boolean="${approveInstance?.mustOk}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${approveInstance?.id}" />
					<g:link class="edit" action="edit" id="${approveInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
