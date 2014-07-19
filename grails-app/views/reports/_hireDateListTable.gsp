<%@ page import="daffron.fms.hr.payroll.EmployeeDependents" %>
<%@ page import="daffron.fms.hr.payroll.SalaryHistory" %>

<table class="report">
    <thead> 
        <tr>
            <g:if test="${params.pdf || params.excel}">
	            <th class="mid">Employee Number</th>
	            <th class="mid">Employee Name</th>
	            <th class="mid">Address</th>
	            <th class="mid">City</th>
	            <th class="mid">State</th>
	            <th class="mid">Hire Date</th>
	            <th class="mid">ReHire Date</th>
	            <th class="mid">Adj Hire Date</th>
	        </g:if>
	        <g:else>
	            <g:sortableColumn class="mid" property="id" title="Employee Number" />
	            <g:sortableColumn class="mid" property="name" title="Employee Name" />
	            <g:sortableColumn class="mid" property="address" title="Address" />
	            <g:sortableColumn class="mid" property="city" title="City" />
	            <g:sortableColumn class="mid" property="state" title="State" />
	            <g:sortableColumn class="mid" property="hireDate" title="Hire Date" />
	            <g:sortableColumn class="mid" property="reHireDate" title="ReHire Date" />
	            <g:sortableColumn class="mid" property="adjustedHireDate" title="adjustedHireDate" />
	        </g:else>
        </tr>
    </thead>
    <tbody>
    <g:each in="${payrollList}" status="i" var="emp">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td class="num">${emp?.id}</td>
            <td class="left">${emp?.name}</td>
            <td class="left">${emp?.address?.encodeAsHTML()}</td>
            <td class="left">${emp?.city}</td>
            <td class="mid">${emp?.state}</td>
            <td class="mid">${emp?.hireDate}</td>
            <td class="mid">${emp?.reHireDate}</td>
            <td class="mid">${emp?.adjustedHireDate}</td>
        </tr>
    </g:each>
    </tbody>
</table>