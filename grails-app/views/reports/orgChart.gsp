<%@ page import="daffron.fms.hr.payroll.EmployeePayrollMaster" %>
<html>
    <head>
        <meta name="layout" content="main" /> 
        <link rel="stylesheet" href="${resource(dir:'css',file:'buttons.css')}"/> 
        <r:require module="common"/>
        <% if (params.pdf) {%>
            <link rel="stylesheet" href="${resource(dir:'css',file:'reportsPDF.css')}"  media="print"/>
        <% } else if (!params.excel) { %>
            <link rel="stylesheet" href="${resource(dir:'css',file:'reports.css')}"/>
        <% } %>
        <title>Organization Chart</title>
        
        <link rel="stylesheet" href="${resource(dir:'css',file:'jOrgChartCustom.css')}"/>
        <link rel="stylesheet" href="${resource(dir:'css',file:'jOrgChart.css')}"/> 
    </head>
    <body>
        <div style="-fs-page-sequence: start; page-break-before: avoid">
            <h1>Organization Chart </h1>
            <div class="list">
                ${orgList}
            </div>
            <div id="chart" class="jOrgChart"></div>
       </div>
		<g:javascript src="jOrgChart.js"/>
	    <script>
		    jQuery(document).ready(function() {
		        $("#orgList").jOrgChart({
		            chartElement : '#chart',
		            dragAndDrop  : true
		        });
		    });
	    </script>
    </body>
</html>