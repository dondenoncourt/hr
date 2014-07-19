<%@ page import="daffron.fms.hr.payroll.EmployeeDependents" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <r:require module="common"/>
        <title>EmployeePayrollMaster List</title>
    </head>
    <body>
        <div class="body" style="-fs-page-sequence: start; page-break-before: always">
        	<% if (params.pdf) {%>
        		<g:render template="../pdfHeaders" />
		 	<% } %>
            <h1>EmployeePayrollMaster List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                 <table>
                    <thead>
                        <tr>
                   	        <g:sortableColumn property="name" title="Name" />
                   	        <th>DOH</th>
                   	        <th>YOS</th>
                   	        <th>Adjusted Hire Date</th>
                   	        <th>DOB</th>
                   	        <th>Age</th>
                   	        <th>SSN</th>
                   	        <th>Marital Status</th>
                   	        <th>Spouse</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${payrollList}" status="i" var="emp">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        	<% def now = new java.util.Date() %>
                            <td>${emp.name?.encodeAsHTML()}</td>
                            <td ><g:formatDate date="${emp.hireDate}" format="yyyy-MM-dd"/>  </td>
                            <td >${(emp.hireDate?(((now - emp.hireDate)/365).setScale(1, BigDecimal.ROUND_HALF_UP)):0)}  </td>
                            <td ><g:formatDate date="${emp.adjustedHireDate}" format="yyyy-MM-dd"/>  </td>
                            <td ><g:formatDate date="${emp.birthDate}" format="yyyy-MM-dd"/>  </td>
                            <td >${(emp.hireDate?(((now - emp.birthDate)/365).setScale(0, BigDecimal.ROUND_DOWN)):0)}  </td>
                            <% def ssn = emp.socialSecurityNo.toString() %>
                            <td>${emp.formatSSN()}</td>
                            <td>${emp.maritalStatus}</td>
                            <td>${EmployeeDependents.findByEmployeeNoAndRelationship(emp.id, 'S')?.name}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <% if (!params.pdf) { %>
	            <div class="paginateButtons">
	                <g:paginate total="${count}" />
	            </div>
	            <g:link controller="pdf" action="show" params="[url:'/reports/list']" class="pdf">PDF</g:link>
            <% } %>
        </div>
    </body>
</html>
