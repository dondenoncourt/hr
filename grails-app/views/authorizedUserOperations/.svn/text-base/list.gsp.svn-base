<%@ page import="daffron.fms.AuthorizedUserOperations" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>AuthorizedUserOperations List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New AuthorizedUserOperations</g:link></span>
        </div>
        <div class="body">
            <h1>AuthorizedUserOperations List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                   	        <g:sortableColumn property="id" title="Id" />
                   	        <g:sortableColumn property="authorityOperationId" title="Authority Operation Id" />
                   	        <g:sortableColumn property="userId" title="User Id" />
                   	        <g:sortableColumn property="permission" title="Permission" />
                   	        <g:sortableColumn property="newEntity" title="New Entity" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${authorizedUserOperationsInstanceList}" status="i" var="authorizedUserOperationsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
							<td><daffron:linkWithKey domain="${authorizedUserOperationsInstance}"   action="show"/></td>
                            <td>${authorizedUserOperationsInstance.authorityOperationId?.encodeAsHTML()}</td>
                            <td>${authorizedUserOperationsInstance.userId?.encodeAsHTML()}</td>
                            <td>${authorizedUserOperationsInstance.permission?.encodeAsHTML()}</td>
                            <td>${authorizedUserOperationsInstance.newEntity?.encodeAsHTML()}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${AuthorizedUserOperations.count()}" />
            </div>
        </div>
    </body>
</html>
