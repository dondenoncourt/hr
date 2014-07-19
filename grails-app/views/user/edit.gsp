

<%@ page import="daffron.fms.hr.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <r:require module="common"/>
        <link rel="stylesheet" href="${resource(dir:'css',file:'buttons.css')}" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="buttons linkBtns">
            <a class="home button" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
            <g:link class="list button" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>
            <g:link class="add button" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>
        <div class="clear"></div>
           <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
           <g:if test="${flash.message}">
           <div class="msg">${flash.message}</div>
           </g:if>
           <g:hasErrors bean="${userInstance}">
           <div class="errors">
               <g:renderErrors bean="${userInstance}" as="list" />
           </div>
           </g:hasErrors>
           <g:form method="post" >
               <g:hiddenField name="id" value="${userInstance?.id}" />
               <g:hiddenField name="version" value="${userInstance?.version}" />
                   <table class="user">
                       <tbody>	                        
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="fullName"><g:message code="user.fullName.label" default="Full Name" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'fullName', 'errors')}">
                                   <g:textField name="fullName" maxlength="60" value="${userInstance?.fullName}" />
                               </td>
                           </tr>
                       
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="password"><g:message code="user.password.label" default="Password" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
                                   <g:textField name="password" maxlength="30" value="${userInstance?.password}" />
                               </td>
                           </tr>
                       
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="contactId"><g:message code="user.contactId.label" default="Contact Id" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'contactId', 'errors')}">
                                   <g:textField name="contactId" value="${fieldValue(bean: userInstance, field: 'contactId')}" />
                               </td>
                           </tr>
                       
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="defaultSecurityLevel"><g:message code="user.defaultSecurityLevel.label" default="Default Security Level" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'defaultSecurityLevel', 'errors')}">
                                   <g:textField name="defaultSecurityLevel" value="${fieldValue(bean: userInstance, field: 'defaultSecurityLevel')}" />
                               </td>
                           </tr>
                       
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="glSecurityLevel"><g:message code="user.glSecurityLevel.label" default="Gl Security Level" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'glSecurityLevel', 'errors')}">
                                   <g:textField name="glSecurityLevel" value="${fieldValue(bean: userInstance, field: 'glSecurityLevel')}" />
                               </td>
                           </tr>
                       
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="cisSecurityLevel"><g:message code="user.cisSecurityLevel.label" default="Cis Security Level" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'cisSecurityLevel', 'errors')}">
                                   <g:textField name="cisSecurityLevel" value="${fieldValue(bean: userInstance, field: 'cisSecurityLevel')}" />
                               </td>
                           </tr>
                       
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="apSecurityLevel"><g:message code="user.apSecurityLevel.label" default="Ap Security Level" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'apSecurityLevel', 'errors')}">
                                   <g:textField name="apSecurityLevel" value="${fieldValue(bean: userInstance, field: 'apSecurityLevel')}" />
                               </td>
                           </tr>
                       
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="arSecurityLevel"><g:message code="user.arSecurityLevel.label" default="Ar Security Level" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'arSecurityLevel', 'errors')}">
                                   <g:textField name="arSecurityLevel" value="${fieldValue(bean: userInstance, field: 'arSecurityLevel')}" />
                               </td>
                           </tr>
                       
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="faSecurityLevel"><g:message code="user.faSecurityLevel.label" default="Fa Security Level" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'faSecurityLevel', 'errors')}">
                                   <g:textField name="faSecurityLevel" value="${fieldValue(bean: userInstance, field: 'faSecurityLevel')}" />
                               </td>
                           </tr>
                       
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="ivSecurityLevel"><g:message code="user.ivSecurityLevel.label" default="Iv Security Level" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'ivSecurityLevel', 'errors')}">
                                   <g:textField name="ivSecurityLevel" value="${fieldValue(bean: userInstance, field: 'ivSecurityLevel')}" />
                               </td>
                           </tr>
                       
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="prSecurityLevel"><g:message code="user.prSecurityLevel.label" default="Pr Security Level" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'prSecurityLevel', 'errors')}">
                                   <g:textField name="prSecurityLevel" value="${fieldValue(bean: userInstance, field: 'prSecurityLevel')}" />
                               </td>
                           </tr>
                       
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="hrSecurityLevel"><g:message code="user.hrSecurityLevel.label" default="Hr Security Level" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'hrSecurityLevel', 'errors')}">
                                   <g:textField name="hrSecurityLevel" value="${fieldValue(bean: userInstance, field: 'hrSecurityLevel')}" />
                               </td>
                           </tr>
                       
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="trSecurityLevel"><g:message code="user.trSecurityLevel.label" default="Tr Security Level" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'trSecurityLevel', 'errors')}">
                                   <g:textField name="trSecurityLevel" value="${fieldValue(bean: userInstance, field: 'trSecurityLevel')}" />
                               </td>
                           </tr>
                       
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="woSecurityLevel"><g:message code="user.woSecurityLevel.label" default="Wo Security Level" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'woSecurityLevel', 'errors')}">
                                   <g:textField name="woSecurityLevel" value="${fieldValue(bean: userInstance, field: 'woSecurityLevel')}" />
                               </td>
                           </tr>
                       
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="expireDate"><g:message code="user.expireDate.label" default="Expire Date" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'expireDate', 'errors')}">
                                   <g:datePicker name="expireDate" precision="day" value="${userInstance?.expireDate}" default="none" noSelection="['': '']" />
                               </td>
                           </tr>
                       
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="retryLimit"><g:message code="user.retryLimit.label" default="Retry Limit" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'retryLimit', 'errors')}">
                                   <g:textField name="retryLimit" value="${fieldValue(bean: userInstance, field: 'retryLimit')}" />
                               </td>
                           </tr>
                       
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="retryCount"><g:message code="user.retryCount.label" default="Retry Count" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'retryCount', 'errors')}">
                                   <g:textField name="retryCount" value="${fieldValue(bean: userInstance, field: 'retryCount')}" />
                               </td>
                           </tr>
                       
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="note"><g:message code="user.note.label" default="Note" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'note', 'errors')}">
                                   <g:textArea name="note" cols="40" rows="5" value="${userInstance?.note}" />
                               </td>
                           </tr>
                       
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="employeeNo"><g:message code="user.employeeNo.label" default="Employee No" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'employeeNo', 'errors')}">
                                   <g:textField name="employeeNo" value="${fieldValue(bean: userInstance, field: 'employeeNo')}" />
                               </td>
                           </tr>
                       
                           <tr class="prop">
                               <td valign="top" class="name">
                                 <label for="email"><g:message code="user.email.label" default="Email" /></label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
                                   <g:textField name="email" maxlength="50" value="${userInstance?.email}" />
                               </td>
                           </tr>
                       
                       </tbody>
                   </table>
               <div class="buttons">
                   <g:actionSubmit class="update button" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                   <g:actionSubmit class="delete button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
               </div>
           </g:form>
    </body>
</html>
