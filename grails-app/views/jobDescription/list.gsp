
<%@ page import="daffron.fms.hr.recruiting.JobDescription" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="recruiting" />
	    <r:require module="common"/>
        <g:set var="entityName" value="${message(code: 'jobDescription.label', default: 'JobDescription')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="buttons linkBtns">
            <a class="home button" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
            <g:link class="list button" action="list" controller="requisition">Requistion List</g:link>
            <g:link class="list button" action="list" controller="yesNo">Yes/No List</g:link>
            <g:link class="list button" action="list" controller="test">Tests</g:link>
            <g:link class="list button" action="list" controller="techNeed">Tech Need List</g:link>
            <g:link class="add button" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>
        <div class="clear"></div>
        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
        <div class="msg">${flash.message}</div>
        </g:if>
        <table class="recruitment">
            <thead>
                <tr>
                    <th>Title</th>
                    <g:sortableColumn property="job" title="${message(code: 'jobDescription.job.label', default: 'Job')}" />
                    <g:sortableColumn property="cdlRequired" title="CDL" />
                    <g:sortableColumn property="unionJob" title="Union Job" />
                </tr>
            </thead>
            <tbody>
            <g:each in="${jobDList}" status="i" var="jobD">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    <td><g:link action="show" id="${jobD.id}">${jobD.jobClass}</g:link></td>
                    <td>${fieldValue(bean: jobD, field: "job")}</td>
                    <td>${jobD.cdlRequired}</td>
                    <td>${jobD.unionJob}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <div class="paginateButtons">
            <g:paginate total="${jobDTotal}" />
        </div>
    </body>
</html>
