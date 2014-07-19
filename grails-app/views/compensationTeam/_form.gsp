<%@ page import="daffron.fms.hr.recruiting.CompensationTeam" %>
<%@ page import="daffron.fms.hr.payroll.PrCodes" %>
<%@ page import="daffron.fms.gl.Department" %>



<div class="fieldcontain ${hasErrors(bean: compensationTeamInstance, field: 'id', 'error')} required">
	<label for="employee">
		<g:message code="compensationTeam.employee.label" default="Department" />
		<span class="required-indicator">*</span>
	</label>
	<g:if test="${departmentDescriptions[0] instanceof Department}">
		<g:select id="department" name="department" from="${departmentDescriptions}" 
		   optionKey="departmentCode" required="true" value="${compensationTeamInstance?.id}" class="one-to-one"/>
    </g:if>
    <g:else>
		<g:select id="department" name="department" from="${departmentDescriptions}" 
		   optionKey="field" required="true" value="${compensationTeamInstance?.id}" class="one-to-one"/>
    </g:else>
</div>
<div class="fieldcontain ${hasErrors(bean: compensationTeamInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="compensationTeam.employee.label" default="Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employee" name="employee.id" from="${daffron.fms.hr.payroll.EmployeePayrollMaster.listOrderByName()}" 
	   optionKey="id" required="true" value="${compensationTeamInstance?.employee?.id}" class="many-to-one"/>
</div>


