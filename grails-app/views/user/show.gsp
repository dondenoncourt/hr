
<%@ page import="daffron.fms.hr.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <r:require module="common"/>
        <link rel="stylesheet" href="${resource(dir:'css',file:'buttons.css')}" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="buttons linkBtns">
			<a class="home button" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			<g:link class="list button" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>
			<g:link class="add button" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>
		<div class="clear"></div>
        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
		<g:if test="${flash.message}">
		<div class="msg">${flash.message}</div>
		</g:if>
		 <table class="user">
		     <tbody>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.id.label" default="Id" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "id")}</td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.fullName.label" default="Full Name" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "fullName")}</td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.password.label" default="Password" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "password")}</td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.contactId.label" default="Contact Id" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "contactId")}</td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.defaultSecurityLevel.label" default="Default Security Level" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "defaultSecurityLevel")}</td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.glSecurityLevel.label" default="Gl Security Level" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "glSecurityLevel")}</td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.cisSecurityLevel.label" default="Cis Security Level" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "cisSecurityLevel")}</td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.apSecurityLevel.label" default="Ap Security Level" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "apSecurityLevel")}</td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.arSecurityLevel.label" default="Ar Security Level" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "arSecurityLevel")}</td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.faSecurityLevel.label" default="Fa Security Level" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "faSecurityLevel")}</td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.ivSecurityLevel.label" default="Iv Security Level" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "ivSecurityLevel")}</td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.prSecurityLevel.label" default="Pr Security Level" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "prSecurityLevel")}</td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.hrSecurityLevel.label" default="Hr Security Level" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "hrSecurityLevel")}</td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.trSecurityLevel.label" default="Tr Security Level" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "trSecurityLevel")}</td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.woSecurityLevel.label" default="Wo Security Level" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "woSecurityLevel")}</td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.expireDate.label" default="Expire Date" /></td>
		             
		             <td valign="top" class="value"><g:formatDate date="${userInstance?.expireDate}" /></td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.retryLimit.label" default="Retry Limit" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "retryLimit")}</td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.retryCount.label" default="Retry Count" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "retryCount")}</td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.note.label" default="Note" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "note")}</td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.employeeNo.label" default="Employee No" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "employeeNo")}</td>
		             
		         </tr>
		     
		         <tr class="prop">
		             <td valign="top" class="name"><g:message code="user.email.label" default="Email" /></td>
		             
		             <td valign="top" class="value">${fieldValue(bean: userInstance, field: "email")}</td>
		                
		            </tr>
		        
		        </tbody>
		    </table>
		<div class="buttons">
		    <g:form>
		     <g:hiddenField name="id" value="${userInstance?.id}" />
		     <g:actionSubmit class="edit button" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
		     <g:actionSubmit class="delete button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
		 </g:form>
		</div>
    </body>
</html>
