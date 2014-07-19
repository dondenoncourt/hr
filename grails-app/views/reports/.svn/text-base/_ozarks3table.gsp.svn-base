<%@ page import="daffron.fms.hr.payroll.EmployeeDependents" %>

<table class="report">
	<thead> 
	    <tr>
	        <th class="left">Promo or Hire</th>
	        <th class="right">Per Hour</th>
	        <th class="right">Shift Premium</th>
	        <th class="right">Per Month (165 hours / month)</th>
	        <th class="right">Annual (2000 hours / year)</th>
	        <th class="center">Race</th>
	        <th class="center">Sex</th>
	        <th class="center">Veteran</th>
	    </tr>
	</thead>
	<tbody>
		<g:each in="${payrollList}" status="i" var="emp">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<td class="left">${emp.salaryHistoryTransType}</td>
				<td class="right">${(emp.payRate < 1000)?emp.payRate:''}</td>
				<td class="right">${emp.shiftPremium?:''}</td>
				<td class="right"><g:formatNumber number="${(emp.payRate < 1000)?emp.payRate * 165:emp.payRate * 4}" format="###,###,##0"/></td>
				<td class="right"><g:formatNumber number="${(emp.payRate < 1000)?emp.payRate * 2000:emp.payRate * 52}"  format="###,###,##0" /></td>
				<td class="center">${emp.race}</td>
				<td class="center">${emp.sex}</td>
				<td class="center"><% if (emp.veteran) { %> Y <% } %></td>
			</tr>
		</g:each>
    </tbody>
</table>