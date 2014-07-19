<%@ page import="daffron.fms.hr.recruiting.JobClassDescription" %>
<%@ page import="daffron.fms.hr.payroll.EmployeePayrollMaster" %>

<table class="report">
    <thead> 
        <tr>
            <g:if test="${params.pdf || params.excel}">
	            <th>Employee No.</th>
	            <th>Employee Name</th>
	            <th>Overtime Hours</th>
	            <th>Overtime Dollars</th>
	            <th>Dbl Time Hours</th>
	            <th>Dbl Time Dollars</th>
	        </g:if>
	        <g:else>
	            <g:sortableColumn property="id" title="Employee No." />
	            <g:sortableColumn property="name" title="Employee Name" />
	            <g:sortableColumn property="overtimeHours" title="Overtime Hours" />
	            <g:sortableColumn property="overtimeGross" title="Overtime Dollars" />
	            <g:sortableColumn property="doubleTimeHours" title="Dbl Time Hours" />
	            <g:sortableColumn property="doubleTimeGross" title="Dbl Time Dollars" />
	        </g:else>
            <th>Total Hours</th>
            <th>Total Overtime Gross</th>
            <th>Gross Pay</th>
        </tr>
    </thead>
    <tbody>
    <g:each in="${payrollList}" status="i" var="emp">       
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td>${emp.id}</td>
            <td>${emp.name}</td>
            <td><g:formatNumber number="${emp.overtimeHours}" format="##,###,##0"/></td>
            <td><g:formatNumber number="${emp.overtimeGross}" type="currency" currencyCode="USD" /></td>            
            <td class="num"><g:formatNumber number="${emp.doubleTimeHours}" format="##,###,##0"/></td>
            <td class="num"><g:formatNumber number="${emp.doubleTimeGross}" type="currency" currencyCode="USD" /></td>           
            <td class="num"><g:formatNumber number="${emp?.overtimeHours + emp?.doubleTimeHours + emp.regularHours}" format="##,###,##0"/></td>            
            <td class="num"><g:formatNumber number="${emp.overtimeGross + emp.doubleTimeGross}" type="currency" currencyCode="USD" /></td>
            <td class="num"><g:formatNumber number="${emp.regularGross + emp.overtimeGross + emp.doubleTimeGross}" type="currency" currencyCode="USD" /></td>
        </tr>
    </g:each>
        <%-- <tr class="totals">
            <td colspan="4">Total:</td>
            <td>${totalForDept}</td>
            <td>${totalMinForDept}</td>
            <td>&#160;</td>
            <td>${totalFemForDept}</td>
            <td>&#160;</td>
        </tr> --%>
    </tbody>
</table>