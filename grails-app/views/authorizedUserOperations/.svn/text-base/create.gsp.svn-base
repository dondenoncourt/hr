<%@ page import="daffron.fms.AuthorizedUserOperations" %>
<%@ page import="daffron.fms.hr.User" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create AuthorizedUserOperations</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">AuthorizedUserOperations List</g:link></span>
        </div>
        <div class="body">
            <h1>Create AuthorizedUserOperations</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${authorizedUserOperationsInstance}">
            <div class="errors">
                <g:renderErrors bean="${authorizedUserOperationsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <g:hiddenField name="newEntity" value="${true}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authorityOperationId">Authority Operation Id:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:authorizedUserOperationsInstance,field:'authorityOperationId','errors')}">
                                    <g:select name="authorityOperationId" from="${authOps}"
                                        value="${authorizedUserOperationsInstance.authorityOperationId}"
                                        optionKey="authorityOperationId"
                                        optionValue="uri"
                                        noSelection="['':'-Pick Operation-']" 
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
                                        noSelection="['':'-Pick User-']" 
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
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>