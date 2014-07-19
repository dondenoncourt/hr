<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <r:require module="common"/>
        <g:set var="entityName" value="${message(code: 'covered.label', default: 'Covered')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${coveredInstance}">
            <div class="errors">
                <g:renderErrors bean="${coveredInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="relationship"><g:message code="covered.relationship.label" default="Relationship" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coveredInstance, field: 'relationship', 'errors')}">
                                    <g:select name="relationship" from="${coveredInstance.constraints.relationship.inList}" value="${coveredInstance?.relationship}" valueMessagePrefix="covered.relationship" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gender"><g:message code="covered.gender.label" default="Gender" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coveredInstance, field: 'gender', 'errors')}">
                                    <g:select name="gender" from="${coveredInstance.constraints.gender.inList}" value="${coveredInstance?.gender}" valueMessagePrefix="covered.gender"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="birth"><g:message code="covered.birth.label" default="Birth" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coveredInstance, field: 'birth', 'errors')}">
                                    <g:datePicker name="birth" precision="day" value="${coveredInstance?.birth}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enroll"><g:message code="covered.enroll.label" default="Enroll" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coveredInstance, field: 'enroll', 'errors')}">
                                    <g:select name="enroll.id" from="${Enroll.list()}" optionKey="id" value="${coveredInstance?.enroll?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="covered.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coveredInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${coveredInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ssn"><g:message code="covered.ssn.label" default="Ssn" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coveredInstance, field: 'ssn', 'errors')}">
                                    <g:textField name="ssn" value="${fieldValue(bean: coveredInstance, field: 'ssn')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
