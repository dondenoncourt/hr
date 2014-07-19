<%@ page import="daffron.fms.hr.payroll.SalaryHistory" %>
<%@ page import="daffron.fms.hr.payroll.EmployeePayrollMaster" %>
<%@ page import="daffron.fms.hr.recruiting.Requisition" %> 

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
        <title>Appraisal Schedule</title>
    </head>
    <body>
        <g:form action="appraisalSchedule">
        <div style="-fs-page-sequence: start; page-break-before: avoid">
            <% if (params.pdf) {%>
                <g:render template="../pdfReportHeaders" />
            <% } %>
            <h1>Appraisal Schedule 
                <g:if test="${params.pdf && params.sort}">
                    Sorted by: ${params.sort} ${params.order}
                </g:if>
            </h1>
            <% if (!params.pdf) { %>
	            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
	            </g:if>            
	            <div class="clear"></div>
	            <dl class="rtl">
	                <dt>From Date:</dt>
	                <dd><input type="text" class="date" name="startDate" value="${params.startDate}" /></dd>
	                <dt>To Date:</dt>
	                <dd><input type="text" class="date" name="endDate" value="${params.endDate}" /></dd>
	                <dt>Employee:</dt>
	                <dd><g:textField name="eeName" id="employees" value="${params.eeName}" /></dd>
	            </dl>
	            <div class="buttons">
	             <g:hiddenField name="employeeID" id="employeeID" value="" />
	             <g:submitButton class="search button" action="search" name="list" value="Search" title="search"/>
	            </div>
	            
	            <div class="clear"></div><br />
			<% } %>
            <g:if test="${count > 0}">
            <div>
	            <% if (!params.pdf) { %>            
		            <div class="icons">
		                <g:link controller="pdf" action="show" params="[url:'/reports/appraisalSchedule',sort:params.sort,order:params.order]" class="pdf" title="Export to PDF" />
		                <g:link class="xls" title="Export to Excel" params="[excel:'true']" controller="reports" action="appraisalSchedule" />
		            </div> 
                    <div class="clear"></div>                
                <% } %>
	            <div class="list">
	                <g:render  template="appraisalScheduleTable" model="[payrollList:payrollList]"/>
	            </div>
	            <% if (!params.pdf && !params.excel) { %>
	                <div class="paginateButtons">
	                    <g:paginate total="${count}" params="${params}" />
	                </div>
	            <% } %>
            </div>
            </g:if>
            <g:else>
                <div class="message">
                    Sorry, your search returned 0 results.
                </div>
            </g:else>
       </div>
       </g:form>
       <g:if test="${!params.pdf}">
            <g:javascript>
                function getEENames(request, response) {
                    $.ajax({
                        url: "${createLink(controller:'requisition', action:'empNames')}", 
                        data: "name="+request.term,
                        type: "POST",
                        dataFilter: function(data) { return data; },
                        success: function(data) {response($.map(data, function(item) {return {value: item.name}}))},
                        error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
                    });
                }
                $("#employees").blur(function() {
                    $.ajax({
                        url: "${createLink(controller:'requisition', action:'empNoByName')}", 
                        data: "name="+$(this).val(),
                        type: "POST",
                        success: function(data) { 
                          $('#employeeID').val(data);
                        },
                        error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
                    });
                });
                $("#employees").autocomplete({
                    source: getEENames,
                    minLength: 1
                })
                $(".date" ).datepicker(); 
            </g:javascript>
        </g:if>
    </body>    
</html>

