

<%@ page import="daffron.fms.hr.safety.Doctor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <r:require module="common"/>
        <g:set var="entityName" value="${message(code: 'doctor.label', default: 'Doctor')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${doctorInstance}">
            <div class="errors">
                <g:renderErrors bean="${doctorInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${doctorInstance?.id}" />
                <g:hiddenField name="version" value="${doctorInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="phoneNo"><g:message code="doctor.phoneNo.label" default="Phone No" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: doctorInstance, field: 'phoneNo', 'errors')}">
                                    <g:textField name="phoneNo" value="${doctorInstance?.phoneNo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="doctor.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: doctorInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${doctorInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name"> <label for="name">line1</label> </td>
                                <td valign="top" class="value ${hasErrors(bean: doctorInstanc, field: 'addr.line1', 'errors')}">
                                    <g:textField name="addr.line1" value="${doctorInstance?.addr?.line1}" />
                                </td>
                            <tr class="prop">
                                <td valign="top" class="name"> <label for="name">line2</label> </td>
                                <td valign="top" class="value ${hasErrors(bean: doctorInstance, field: 'addr.line2', 'errors')}">
                                    <g:textField name="addr.line2" value="${doctorInstance?.addr?.line2}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name"> <label for="name">City</label> </td>
                                <td valign="top" class="value ${hasErrors(bean: doctorInstance, field: 'addr.city', 'errors')}">
                                    <g:textField name="addr.city" value="${doctorInstance?.addr?.city}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name"> <label for="name">State</label> </td>
                                <td valign="top" class="value ${hasErrors(bean: doctorInstance, field: 'addr.state', 'errors')}">
                                    <g:textField name="addr.state" value="${doctorInstance?.addr?.state}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name"> <label for="name">Zip</label> </td>
                                <td valign="top" class="value ${hasErrors(bean: doctorInstance, field: 'addr.zip', 'errors')}">
                                    <g:textField name="addr.zip" value="${doctorInstance?.addr?.zip}" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <g:if test="${action=='show'}">
	                    <span class="button">
	                       <g:link action="edit" class="edit" id="${incident?.id}">Edit</g:link>
	                    </span>
                    </g:if>
                    <g:elseif test="${action=='create'}">
	                    <span class="button"><g:actionSubmit class="save" action="save" value="Create" /></span>
                    </g:elseif>
                    <g:elseif test="${action=='edit'}">
	                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
	                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    </g:elseif>
                </div>
            </g:form>
        </div>
    </body>
</html>
