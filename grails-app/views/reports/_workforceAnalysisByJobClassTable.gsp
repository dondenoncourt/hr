<%@ page import="daffron.fms.hr.recruiting.JobClassDescription" %>
<%@ page import="daffron.fms.hr.payroll.EmployeePayrollMaster" %>

<table class="report">
    <thead> 
        <tr>
            <th class="left">Job Class</th>
            <th class="left">Job Class Description</th>
            <th class="left">Total Employees</th>
            <th class="left">Total Minorities</th>
            <th class="mid">Minority %</th>
            <th class="mid">Total Females</th>
            <th class="mid">Females %</th>
        </tr>
    </thead>
    <tbody>
    <g:each in="${payrollList}" status="i" var="jobClass">        
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td class="left">${jobClass?.jobClass}</td>
            <td class="left">${jobClass?.title}</td>
            <% 
                def totalByClass = EmployeePayrollMaster.findAllByJobClass(jobClass?.jobClass)?.size()
				 
                def totalMin = EmployeePayrollMaster.findAllByJobClassAndRaceNotEqual(jobClass?.jobClass, 'W')?.size()
				
                def totalFem = EmployeePayrollMaster.findAllByJobClassAndSex(jobClass?.jobClass, 'F')?.size()
			
				def minPercent = totalMin?(totalMin/totalByClass):0.0
			    def femPercent = totalFem?(totalFem/totalByClass):0.0
            %>
            <td class="num">${totalByClass}</td>
            <td class="num">${totalMin}</td>
            <td class="num"><g:formatNumber number="${minPercent}" type="percent" /></td>
            <td class="num">${totalFem}</td>
            <td class="num"><g:formatNumber number="${femPercent}" type="percent" /></td>
        </tr>
    </g:each>
    </tbody>
</table>