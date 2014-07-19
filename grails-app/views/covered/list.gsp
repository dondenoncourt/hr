

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <r:require module="common"/>
        <g:set var="entityName" value="${message(code: 'covered.label', default: 'Covered')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'covered.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="relationship" title="${message(code: 'covered.relationship.label', default: 'Relationship')}" />
                        
                            <g:sortableColumn property="gender" title="${message(code: 'covered.gender.label', default: 'Gender')}" />
                        
                            <g:sortableColumn property="birth" title="${message(code: 'covered.birth.label', default: 'Birth')}" />
                        
                            <th><g:message code="covered.enroll.label" default="Enroll" /></th>
                        
                            <g:sortableColumn property="name" title="${message(code: 'covered.name.label', default: 'Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${coveredInstanceList}" status="i" var="coveredInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${coveredInstance.id}">${fieldValue(bean: coveredInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: coveredInstance, field: "relationship")}</td>
                        
                            <td>${fieldValue(bean: coveredInstance, field: "gender")}</td>
                        
                            <td><g:formatDate date="${coveredInstance.birth}" /></td>
                        
                            <td>${fieldValue(bean: coveredInstance, field: "enroll")}</td>
                        
                            <td>${fieldValue(bean: coveredInstance, field: "name")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${coveredInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
