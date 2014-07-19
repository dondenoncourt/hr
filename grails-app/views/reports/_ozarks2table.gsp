<%@ page import="daffron.fms.hr.payroll.EmployeeDependents" %>
<%@ page import="daffron.fms.hr.payroll.SalaryHistory" %>

<table class="report">
    <thead> 
        <tr>
   	        <th class="left">Address</th>
   	        <th class="left">City</th>
   	        <th class="left">State</th>
   	        <th class="right">Zip</th>
   	        <th class="right">Phone</th>
   	        <th class="right">Department</th>
   	        <th class="right">Position</th>
   	        <th class="right">EEO-1</th>
   	        <th class="right">Last Position</th>
   	        <th class="right">Promotion Date</th>
        </tr>
    </thead>
    <tbody>
    <g:each in="${payrollList}" status="i" var="emp">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td class="left">${emp?.address?.encodeAsHTML()}</td>
            <td class="left">${emp?.city}</td>
            <td class="left">${emp?.state}</td>
            <td class="right">${emp?.zipCode}</td>
            <td class="right">${emp?.phoneNo}</td>
            <td class="right">${emp?.department}</td>
            <td class="right">${emp?.jobClass}</td>
            <td class="right">${emp?.eeoClass}</td>
            	<%
					def hist = SalaryHistory.findAllByEmpNo(emp?.empNo, [sort:'salHistPayDate', order:'desc'])
					boolean prior = hist?.size() as boolean 
				%>
            <td class="right">${(prior?hist[0]?.jobClass:'')}</td>
            <td class="right">
            	<% if (prior) { %>
                    	<g:formatDate date="${hist[0]?.salHistPayDate}" format="yyyy-MM-dd"/>
				<% } %>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>
                            
