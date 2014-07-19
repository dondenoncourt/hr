

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <r:require module="common"/>
        <g:set var="entityName" value="${message(code: 'covered.label', default: 'Covered')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="covered.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: coveredInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="covered.relationship.label" default="Relationship" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: coveredInstance, field: "relationship")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="covered.gender.label" default="Gender" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: coveredInstance, field: "gender")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="covered.birth.label" default="Birth" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${coveredInstance?.birth}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="covered.enroll.label" default="Enroll" /></td>
                            
                            <td valign="top" class="value"><g:link controller="enroll" action="show" id="${coveredInstance?.enroll?.id}">${coveredInstance?.enroll?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="covered.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: coveredInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="covered.ssn.label" default="Ssn" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: coveredInstance, field: "ssn")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${coveredInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
