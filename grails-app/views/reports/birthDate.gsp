<%@ page import="daffron.fms.hr.payroll.SalaryHistory" %>
 

<html>
    <head>
        <meta name="layout" content="main" /> 
        <r:require module="common"/>
        <link rel="stylesheet" href="${resource(dir:'css',file:'buttons.css')}"/> 
        <g:if test="${params.excel}">
            <meta http-equiv="CONTENT-TYPE" content="application/vnd.ms-excel">
        </g:if>
        <% if (!params.pdf) {%>
            <g:if test="${!params.excel}">
                <link rel="stylesheet" href="${resource(dir:'css',file:'reports.css')}"/>
            </g:if>
        <% } %>
        <% if (params.pdf) {%>
        <link rel="stylesheet" href="${resource(dir:'css',file:'reportsPDF.css')}"  media="print"/>
        <% } %>
        <title>Birth Date List</title>
    </head>
    <body>
        <div style="-fs-page-sequence: start; page-break-before: avoid">
            <% if (params.pdf) {%>
                <g:render template="../pdfReportHeaders" />
            <% } %>
            <h1>Birth Date List  
                <g:if test="${params.pdf && params.sort}">
                    Sorted by: ${params.sort} ${params.order}
                </g:if>
            </h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <% if (!params.pdf) {%>
	            <g:form action="birthDate">
		            <div class="clear"></div>
		            <dl class="rtl">
		                <dt>Month</dt>
		                <dd>
		                   <select name="month">
		                       <option value="0" >-- All Months --</option>
		                       <option value="1" ${params.month == '1'?'selected=selected':''}>January</option>
		                       <option value="2" ${params.month == '2'?'selected=selected':''}>February</option>
		                       <option value="3" ${params.month == '3'?'selected=selected':''}>March</option>
		                       <option value="4" ${params.month == '4'?'selected=selected':''}>April</option>
		                       <option value="5" ${params.month == '5'?'selected=selected':''}>May</option>
		                       <option value="6" ${params.month == '6'?'selected=selected':''}>June</option>
		                       <option value="7" ${params.month == '7'?'selected=selected':''}>July</option>
		                       <option value="8" ${params.month == '8'?'selected=selected':''}>August</option>
		                       <option value="9" ${params.month == '9'?'selected=selected':''}>September</option>
		                       <option value="10" ${params.month == '10'?'selected=selected':''}>October</option>
		                       <option value="11" ${params.month == '11'?'selected=selected':''}>September</option>
		                       <option value="12" ${params.month == '12'?'selected=selected':''}>December</option>
		                   </select>
		                </dd>
		            </dl>
					<g:hiddenField name="sort" value="${params.sort}"/>
					<g:hiddenField name="order" value="${params.order}"/>
			        <div class="buttons">
			             <g:submitButton class="search button" action="search" name="list" value="Search" title="search"/>
			        </div>
		            <div class="clear"></div><br />
	            </g:form>
			<% } %>
            <% if (!params.pdf) { %>            
	            <div class="icons">
	                <g:link controller="pdf" action="show" params="[url:'/reports/birthDate?month-EQUALS-'+(params.month?:0)+'-AMPERSAND-sort-EQUALS-'+(params.sort?:'name')+'-AMPERSAND-order-EQUALS-'+(params.order?:'asc')]" class="pdf" title="Export to PDF" />
	                <g:link class="xls" title="Export to Excel" params="[excel:'true']" controller="reports" action="birthDate" />
	            </div> 
            <% } %>
            <div class="clear"></div>
            <div class="list">
                <g:render  template="birthDateTable" model="[payrollList:payrollList]"/>
            </div>
            <% if (!params.pdf && !params.excel) { %>
                <div class="paginateButtons">
                    <g:paginate total="${count}" params="${params}"/>
                </div>
            <% } %>
       </div>
    </body>
</html>
