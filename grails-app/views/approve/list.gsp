
<%@ page import="daffron.fms.hr.recruiting.Approve" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'approve.label', default: 'Approve')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-approve" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-approve" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="employeeId" title="${message(code: 'approve.employeeId.label', default: 'Employee Id')}" />
					
						<g:sortableColumn property="jobClassId" title="${message(code: 'approve.jobClassId.label', default: 'Job Class Id')}" />
					
						<g:sortableColumn property="mustOk" title="${message(code: 'approve.mustOk.label', default: 'Must Ok')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${approveInstanceList}" status="i" var="approveInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${approveInstance.id}">${fieldValue(bean: approveInstance, field: "employeeId")}</g:link></td>
					
						<td>${fieldValue(bean: approveInstance, field: "jobClassId")}</td>
					
						<td><g:formatBoolean boolean="${approveInstance.mustOk}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${approveInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
