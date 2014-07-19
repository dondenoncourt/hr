<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'enrollment.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'buttons.css')}" />
        <r:require module="common"/>
        <g:set var="entityName" value="${message(code: 'enroll.label', default: 'Enroll')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
		<h1><g:message code="default.list.label" args="[entityName]" /></h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		
		<g:form action="list" method="post">
		Search on name prefix: <input type="text" size="15" name="name" value="${params.name}" />
		<g:submitButton class="search button" name="enrollSearch" value="Search" />
		</g:form>
		
		<table id="enrollList">
           <thead>
               <tr class="topRow">
                    <g:sortableColumn property="id" title="Emp No:Name" />
		            <g:sortableColumn property="waive" title="Waive" />
		            <g:sortableColumn property="election" title="Election" />
		            <g:sortableColumn property="lastUpdated" title="Update Date" />
		        </tr>
		    </thead>
		    <tbody>
		    <g:each in="${enrollList}" status="i" var="enroll">
		        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
		            <td>
		            	<g:link action="contactInfo" class="contactInfoEdit" id="${enroll.id}" title="Click to edit enrollment for ${enroll?.employee?.name}">
		            		<img src="${resource(dir:'images/skin',file:'database_edit.png')}"/>
		            		${enroll?.employee?.id}:${enroll?.employee?.name}
		            	</g:link></td>
		            <td>
		            	<% if (enroll.waive) { %> 
		            		<img src="${resource(dir:'images',file:'checkmark.gif')}"/>
		            	<% } %>
		            </td>
		            <td>${fieldValue(bean: enroll, field: "election")}</td>
		            <td class="cellRight"><g:formatDate format="MM/dd/yyyy" date="${enroll.lastUpdated}"/></td>
		            
		        </tr>
		    </g:each>
		        </tbody>
		    </table>
		<div class="paginateButtons">
		    <g:paginate total="${enrollTotal}" />
		</div>
    </body>
</html>
