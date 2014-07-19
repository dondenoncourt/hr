<%@ page import="daffron.fms.hr.recruiting.JobClassDescription" %>
<%@ page import="daffron.fms.hr.payroll.EmployeePayrollMaster" %>

<html>
<body>
<table class="report">
    <thead> 
        <tr>
            <th class="left">Race</th>
            <th class="left">Sex</th>
            <th class="left">Totals</th>
        </tr>
    </thead>
    <tbody>
    <g:each in="${x}" status="i" var="row">        
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td class="left">${row[0]}</td>
            <td class="left">${row[1]}</td>
            <td>${x[i][2]}</td>
        </tr>
    </g:each>
    </tbody>
</table>
</body>
</html>