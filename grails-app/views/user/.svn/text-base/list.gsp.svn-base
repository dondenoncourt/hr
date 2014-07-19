<%@ page import="daffron.fms.hr.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <r:require module="common"/>
        <link rel="stylesheet" href="${resource(dir:'css',file:'buttons.css')}" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="buttons linkBtns">
            <a class="home button" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
            <g:link class="add button" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>
        <div class="clear"></div>
        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
        </g:if>
		<div class="iXpStd">
			<g:form action="list">
			<dl>
				<dt class="name">Employee Name </dt>
				<dd class="value ${hasErrors(bean: incident, field: 'employee', 'errors')}">
		   			<g:textField name="employeeNamePrefix" value="${params.employeeNamePrefix}" />&#160;
		   			<g:actionSubmit class="search button" action="list" value="Search" />
				</dd>
			</dl>
		</g:form>
		</div>
		<div class="clear"></div>
        <table class="user">
            <thead>
                <tr>
                    <g:sortableColumn property="id" title="${message(code: 'user.id.label', default: 'Id')}" />
                   <g:sortableColumn property="fullName" title="${message(code: 'user.fullName.label', default: 'Full Name')}" />
                   <g:sortableColumn property="password" title="${message(code: 'user.password.label', default: 'Password')}" />
                   <g:sortableColumn property="contactId" title="${message(code: 'user.contactId.label', default: 'Contact Id')}" />
                   <g:sortableColumn property="defaultSecurityLevel" title="${message(code: 'user.defaultSecurityLevel.label', default: 'Default Security Level')}" />
                   <g:sortableColumn property="hrSecurityLevel" title="${message(code: 'user.hrSecurityLevel.label', default: 'HR Security Level')}" />
                   <g:sortableColumn property="employeeNo" title="${message(code: 'user.employeeNo.label', default: 'PR Employee #')}" />
               </tr>
           </thead>
           <tbody>
           <g:each in="${userInstanceList}" status="i" var="userInstance">
               <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                   <td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "id")}</g:link></td>
                   <td>${fieldValue(bean: userInstance, field: "fullName")}</td>
                   <td>${fieldValue(bean: userInstance, field: "password")}</td>
                   <td>${fieldValue(bean: userInstance, field: "contactId")}</td>
                   <td>${fieldValue(bean: userInstance, field: "defaultSecurityLevel")}</td>
                   <td>${fieldValue(bean: userInstance, field: "hrSecurityLevel")}</td>
                   <td>${fieldValue(bean: userInstance, field: "employeeNo")}</td>
               </tr>
           </g:each>
           </tbody>
       </table>
        <div class="paginateButtons">
            <g:paginate total="${userInstanceTotal}" />
        </div>
    </body>
</html>
