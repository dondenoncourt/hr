<%@ page import="daffron.fms.AuthorizedUserOperations" %>
<%@ page import="daffron.fms.hr.User" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit AuthorizedUserOperations</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">AuthorizedUserOperations List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New AuthorizedUserOperations</g:link></span>
        </div>
        <div class="body">
            <h1>Edit AuthorizedUserOperations</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${authorizedUserOperationsInstance}">
            <div class="errors">
                <g:renderErrors bean="${authorizedUserOperationsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="newEntity" value="${authorizedUserOperationsInstance.newEntity}" />
                <g:if test="${authorizedUserOperationsInstance.COMPOSITE_KEY == false}">
                    <g:if test="${authorizedUserOperationsInstance.id.class.name == 'String'}">
                        <input type="hidden" name="id" value="${authorizedUserOperationsInstance?.id.trim()}" />
                    </g:if>
                    <g:else>
                        <input type="hidden" name="id" value="${authorizedUserOperationsInstance?.id}" />
                    </g:else>
                </g:if>
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authorityOperationId">Authority Operation Id:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:authorizedUserOperationsInstance,field:'authorityOperationId','errors')}">
                                    <g:select name="authorityOperationId" from="${authOps}"
                                        value="${authorizedUserOperationsInstance.id}"
                                        optionKey="authorityOperationId"
                                        optionValue="uri"
                                    />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="userId">User Id:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:authorizedUserOperationsInstance,field:'userId','errors')}">
                                    <g:select name="userId" from="${User.list(sort:'fullName')}"
                                        value="${authorizedUserOperationsInstance.userId}"
                                        optionKey="id"
                                        optionValue="fullName"
                                    />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="permission">Permission:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:authorizedUserOperationsInstance,field:'permission','errors')}">
		                     		<g:radio name="permission"  value="G" checked="${authorizedUserOperationsInstance.permission == 'G'}" /> Give
		                     		<g:radio name="permission"  value="D" checked="${authorizedUserOperationsInstance.permission == 'D'}" /> Deny
                                </td>
                            </tr> 
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>