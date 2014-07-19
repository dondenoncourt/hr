


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <r:require module="common"/>
        <g:set var="entityName" value="${message(code: 'enroll.label', default: 'Enroll')}" />
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
            <g:hasErrors bean="${enroll}">
            <div class="errors">
                <g:renderErrors bean="${enroll}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="election"><g:message code="enroll.election.label" default="Election" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enroll, field: 'election', 'errors')}">
                                    <g:select name="election" from="${enroll.constraints.election.inList}" value="${enroll?.election}" valueMessagePrefix="enroll.election" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cafeteria"><g:message code="enroll.cafeteria.label" default="Cafeteria" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enroll, field: 'cafeteria', 'errors')}">
                                    <g:select name="cafeteria.id" from="${Cafeteria.list()}" optionKey="id" value="${enroll?.cafeteria?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="employee"><g:message code="enroll.employee.label" default="Employee" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enroll, field: 'employee', 'errors')}">
                                    <g:select name="employee.id" from="${EmployeePayrollMaster.list()}" optionKey="id" value="${enroll?.employee?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="waive"><g:message code="enroll.waive.label" default="Waive" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enroll, field: 'waive', 'errors')}">
                                    <g:checkBox name="waive" value="${enroll?.waive}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save button" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
