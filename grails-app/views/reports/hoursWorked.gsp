<html>
    <head>
        <meta name="layout" content="main" />  
        <r:require module="common"/>
        <link rel="stylesheet" href="${resource(dir:'css',file:'reports.css')}"/>
        <link rel="stylesheet" href="${resource(dir:'css',file:'buttons.css')}"/>
        <title>Hours Worked</title>
    </head>
    <body>
        <h1>Hours Worked</h1>
        <% if (!params.pdf) { %>            
        <div class="icons">
            <g:link controller="pdf" action="show" params="[url:'/reports/yearsOfService',sort:params.sort,order:params.order]" class="pdf" title="Export to PDF" />
            <g:link class="xls" title="Export to Excel" params="[excel:'true']" controller="reports" action="yearsOfService" />
        </div> 
        <% } %>
        <table class="report">
            <thead>
                <tr>
                 <th colspan="3">Current Month</th>
                 <th colspan="2">Year To Date</th>
                 <th>More or Less</th>
                 <th>% Change</th>
                </tr>
                <tr>
                    <th>&#160;</th>
                    <th>2010</th>
                    <th>2011</th>
                    <th>2010</th>
                    <th>2011</th>
                    <th>&#160;</th>
                    <th>&#160;</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="width: 20%)">Regular Hours</td>
                    <td class="num" style="width: 13%)"><g:formatNumber number="32465" format="###,###" /></td>
                    <td class="num" style="width: 13%)"><g:formatNumber number="30856" format="###,###"/></td>
                    <td class="num" style="width: 13%)"><g:formatNumber number="126660" format="###,###"/></td>
                    <td class="num" style="width: 13%)"><g:formatNumber number="124850" format="###,###"/></td>
                    <td class="num" style="width: 14%); color: red;">(<g:formatNumber number="1810" format="###,###"/>)</td>
                    <td class="num" style="width: 14%); color: red;">(<g:formatNumber number="1" format="###,###"/>%)</td>
                </tr>
                <tr>
                    <td>Overtime Hours</td>
                    <td class="num"><g:formatNumber number="1181" format="###,###" /></td>
                    <td class="num"><g:formatNumber number="2491" format="###,###"/></td>
                    <td class="num"><g:formatNumber number="10968" format="###,###"/></td>
                    <td class="num"><g:formatNumber number="7541" format="###,###"/></td>
                    <td class="num" style="color: red;">(<g:formatNumber number="3427" format="###,###"/>)</td>
                    <td class="num" style="color: red;">(<g:formatNumber number="31" format="###,###"/>%)</td>
                </tr>
                <tr>
                    <td>Total Hours</td>
                    <td class="num"><g:formatNumber number="33645" format="###,###" /></td>
                    <td class="num"><g:formatNumber number="33347" format="###,###"/></td>
                    <td class="num"><g:formatNumber number="137627" format="###,###"/></td>
                    <td class="num"><g:formatNumber number="132391" format="###,###"/></td>
                    <td class="num" style="color: red;">(<g:formatNumber number="5236" format="###,###"/>)</td>
                    <td class="num" style="color: red;">(<g:formatNumber number="4" format="###,###"/>%)</td>
                </tr>
                <tr>
                    <td colspan="7">&#160;</td>
                </tr>
                <tr>
                    <td>PTO Taken</td>
                    <td class="num"><g:formatNumber number="2323" format="###,###" /></td>
                    <td class="num"><g:formatNumber number="1776" format="###,###"/></td>
                    <td class="num"><g:formatNumber number="8779" format="###,###"/></td>
                    <td class="num"><g:formatNumber number="7991" format="###,###"/></td>
                    <td class="num" style="color: red;">(<g:formatNumber number="788" format="###,###"/>)</td>
                    <td class="num" style="color: red;">(<g:formatNumber number="9" format="###,###"/>%)</td>
                </tr>
                <tr>
                    <td>Sick Leave Bank Used</td>
                    <td class="num"><g:formatNumber number="152" format="###,###" /></td>
                    <td class="num"><g:formatNumber number="27" format="###,###"/></td>
                    <td class="num"><g:formatNumber number="429" format="###,###"/></td>
                    <td class="num"><g:formatNumber number="321" format="###,###"/></td>
                    <td class="num" style="color: red;">(<g:formatNumber number="108" format="###,###"/>)</td>
                    <td class="num" style="color: red;">(<g:formatNumber number="25" format="###,###"/>%)</td>
                </tr>
                <tr>
                    <td>Holiday Leave Used</td>
                    <td class="num"><g:formatNumber number="1448" format="###,###" /></td>
                    <td class="num"><g:formatNumber number="1440" format="###,###"/></td>
                    <td class="num"><g:formatNumber number="2904" format="###,###"/></td>
                    <td class="num"><g:formatNumber number="1440" format="###,###"/></td>
                    <td class="num" style="color: red;">(<g:formatNumber number="1464" format="###,###"/>)</td>
                    <td class="num" style="color: red;">(<g:formatNumber number="50" format="###,###"/>%)</td>
                </tr>
                <tr>
                    <td>Funeral Leave Used</td>
                    <td class="num"><g:formatNumber number="8" format="###,###" /></td>
                    <td class="num"><g:formatNumber number="0" format="###,###"/></td>
                    <td class="num"><g:formatNumber number="64" format="###,###"/></td>
                    <td class="num"><g:formatNumber number="47" format="###,###"/></td>
                    <td class="num" style="color: red;">(<g:formatNumber number="17" format="###,###"/>)</td>
                    <td class="num" style="color: red;">(<g:formatNumber number="27" format="###,###"/>%)</td>
                </tr>
                <tr>
                    <td>Other</td>
                    <td class="num"><g:formatNumber number="0" format="###,###" /></td>
                    <td class="num"><g:formatNumber number="12" format="###,###"/></td>
                    <td class="num"><g:formatNumber number="40" format="###,###"/></td>
                    <td class="num"><g:formatNumber number="17" format="###,###"/></td>
                    <td class="num" style="color: red;">(<g:formatNumber number="23" format="###,###"/>)</td>
                    <td class="num" style="color: red;">(<g:formatNumber number="58" format="###,###"/>%)</td>
                </tr>
                <tr>
                    <td>Time Without Pay</td>
                    <td class="num"><g:formatNumber number="528" format="###,###" /></td>
                    <td class="num"><g:formatNumber number="59" format="###,###"/></td>
                    <td class="num"><g:formatNumber number="1286" format="###,###"/></td>
                    <td class="num"><g:formatNumber number="1086" format="###,###"/></td>
                    <td class="num" style="color: red;">(<g:formatNumber number="200" format="###,###"/>)</td>
                    <td class="num" style="color: red;">(<g:formatNumber number="16" format="###,###"/>%)</td>
                </tr>
                <tr>
                    <td>Total Hours Not Worked</td>
                    <td class="num"><g:formatNumber number="4459" format="###,###" /></td>
                    <td class="num"><g:formatNumber number="3313" format="###,###"/></td>
                    <td class="num"><g:formatNumber number="13501" format="###,###"/></td>
                    <td class="num"><g:formatNumber number="10902" format="###,###"/></td>
                    <td class="num" style="color: red;">(<g:formatNumber number="2599" format="###,###"/>)</td>
                    <td class="num" style="color: red;">(<g:formatNumber number="19" format="###,###"/>%)</td>
                </tr>
                <tr>
                    <td class="num footer">Actual Hours Worked</b></td>
                    <td class="num footer"><g:formatNumber number="29186" format="###,###" /></td>
                    <td class="num footer"><g:formatNumber number="30034" format="###,###"/></td>
                    <td class="num footer"><g:formatNumber number="124126" format="###,###"/></td>
                    <td class="num footer"><g:formatNumber number="121489" format="###,###"/></td>
                    <td class="num footer" style="color: red;">(<g:formatNumber number="2637" format="###,###"/>)</td>
                    <td class="num footer" style="color: red;">(<g:formatNumber number="2" format="###,###"/>%)</td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
