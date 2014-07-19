<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="recruiting" />
        <g:set var="entityName" value="${message(code: 'jobDescription.label', default: 'JobDescription')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body iXpStd">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobDescription.id.label" default="Id" /></td>
                            <td valign="top" class="value">${fieldValue(bean: jobD, field: "id")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Title</td>
                            <td valign="top" class="value">${jobD.jobClass}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobDescription.adInternal.label" default="Ad Internal" /></td>
                            <td valign="top" class="value">${fieldValue(bean: jobD, field: "adInternal")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobDescription.adExternal.label" default="Ad External" /></td>
                            <td valign="top" class="value">${fieldValue(bean: jobD, field: "adExternal")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobDescription.job.label" default="Job" /></td>
                            <td valign="top" class="value">${fieldValue(bean: jobD, field: "job")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobDescription.dateCreated.label" default="Date Created" /></td>
                            <td valign="top" class="value"><g:formatDate date="${jobD?.dateCreated}" /></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobDescription.lastUpdated.label" default="Last Updated" /></td>
                            <td valign="top" class="value"><g:formatDate date="${jobD?.lastUpdated}" /></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobDescription.unionJob.label" default="Union Job" /></td>
                            <td valign="top" class="value"><g:formatBoolean boolean="${jobD?.unionJob}" /></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobDescription.cdlRequired.label" default="CDL Required" /></td>
                            <td valign="top" class="value"><g:formatBoolean boolean="${jobD?.cdlRequired}" /></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="jobDescription.yesNo.label" default="Yes No" /></td>
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${jobD.yesNo}" var="y">
                                    <li>${y?.encodeAsHTML()}</li>
                                </g:each>
                                </ul>
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Tech Needs</td>
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${jobD.techNeeds}" var="need">
                                    <li>${need?.encodeAsHTML()}</li>
                                </g:each>
                                </ul>
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Tests</td>
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${jobD.tests}" var="test">
                                    <li>${test?.encodeAsHTML()}</li>
                                </g:each>
                                </ul>
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">email questionaire</td>
                            <td valign="top" class="value">${fieldValue(bean: jobD, field: "emailQuiz")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">phone questionaire</td>
                            <td valign="top" class="value">${fieldValue(bean: jobD, field: "phoneQuiz")}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${jobD?.id}" />
                    <g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </g:form>
            </div>
        </div>
    </body>
</html>
