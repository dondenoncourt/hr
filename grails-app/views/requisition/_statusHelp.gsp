<%@ page import="daffron.fms.hr.recruiting.RequisitionStatus" %>
<h2>Status Code List</h2>
<table>
    <tr><th>Status Code</th><th>Status Description</th></tr>
    <g:each in="${RequisitionStatus.activeStatuses()}" status="i" var="status">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td>${status.id}</td>
            <td>${status.desc}</td>
        </tr>
    </g:each>
</table>