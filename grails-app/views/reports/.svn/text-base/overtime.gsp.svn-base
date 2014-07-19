<html>
    <head>
        <meta name="layout" content="main" /> 
        <link rel="stylesheet" href="${resource(dir:'css',file:'buttons.css')}"/> 
        <r:require module="common"/>
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
        <title>Overtime</title>
    </head>
    <body>
        <div style="-fs-page-sequence: start; page-break-before: avoid">
            <% if (params.pdf) {%>
                <g:render template="../pdfReportHeaders" />
            <% } %>
            <h1>Overtime  
                <g:if test="${params.pdf && params.sort}">
                    Sorted by: ${params.sort} ${params.order}
                </g:if>
            </h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <% if (!params.pdf) { %>            
            <div class="icons">
                <g:link controller="pdf" action="show" params="[url:'/reports/overtime',sort:params.sort,order:params.order]" class="pdf" title="Export to PDF" />
                <g:link class="xls" title="Export to Excel" params="[excel:'true']" controller="reports" action="overtime" />
            </div> 
            <% } %>
            <div class="clear"></div>
            <div class="list">
                <g:render template="overtimeTable" model="[payrollList:payrollList]"></g:render>
            </div>
            <% if (!params.pdf && !params.excel) { %>
                <div class="paginateButtons">
                    <g:paginate total="${count}" />
                </div>
            <% } %>
       </div>
    </body>
</html>