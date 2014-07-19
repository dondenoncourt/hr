<%@ page import="daffron.fms.hr.payroll.EmployeeDependents" %>
<%@ page import="daffron.fms.hr.payroll.SalaryHistory" %>

<table class="report">
    <thead> 
        <tr>
            <g:if test="${params.pdf || params.excel}">
                <th class="left">Name</th>
            </g:if>
            <g:else>
	            <g:sortableColumn class="left" property="name" title="Name" />
            </g:else>
            <th class="left">Address</th>
            <g:if test="${params.pdf || params.excel}">
                <th class="left">City</th>
            </g:if>
            <g:else>
	            <g:sortableColumn class="left" property="city" title="City" />
            </g:else>
            <g:if test="${params.pdf || params.excel}">
                <th class="mid">State</th>
            </g:if>
            <g:else>
	            <g:sortableColumn class="mid" property="state" title="State" />
            </g:else>
            <g:if test="${params.pdf || params.excel}">
                <th class="mid">Birth Date</th>
            </g:if>
            <g:else>
	            <g:sortableColumn class="mid" property="birthDate" title="Birth Date" />
            </g:else>
        </tr>
    </thead>
    <tbody>
    <g:each in="${payrollList}" status="i" var="emp">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td class="left">${emp?.name}</td>
            <td class="left">${emp?.address?.encodeAsHTML()}</td>
            <td class="left">${emp?.city}</td>
            <td class="mid">${emp?.state}</td>
            <td class="mid">${emp?.birthDate}</td>
        </tr>
    </g:each>
    </tbody>
</table>