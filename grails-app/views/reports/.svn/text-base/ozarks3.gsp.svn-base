<%@ page import="daffron.fms.hr.payroll.EmployeeDependents" %>
 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <r:require module="common"/>
        <% if (!params.pdf) {%>
			<g:if test="${!params.excel}">
    			<link rel="stylesheet" href="${resource(dir:'css',file:'reports.css')}"/>
			</g:if>
		<% } %>
		<% if (params.pdf) {%>
    	<link rel="stylesheet" href="${resource(dir:'css',file:'reportsPDF.css')}"  media="print"/>
		<% } %>
        <title>EmployeePayrollMaster List</title>
    </head>
    <body>
        <div class="body" style="-fs-page-sequence: start; page-break-before: always">
        	<% if (params.pdf) {%>
        		<g:render template="../pdfHeaders" />
		 	<% } %>
            <h1>Years Worked</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <% if (!params.pdf) {%>			
            <div class="icons">
				<%--<g:link class="xls" title="Export to Excel" params="[excel:'true']" controller="reports" action="ozarks3" /> --%>
            	<g:link controller="pdf" action="show" params="[url:'/reports/ozarks3']" class="pdf" title="Export to PDF" />
            </div> 
			<% } %>
            <div class="list">
                 <g:render  template="ozarks3table" model="[payrollList:payrollList]"/>
            </div>
            <% if (!params.pdf) { %>
	            <div class="paginateButtons">
	                <g:paginate total="${count}" />
	            </div>
            <% } %>
        </div>
    </body>
</html>
