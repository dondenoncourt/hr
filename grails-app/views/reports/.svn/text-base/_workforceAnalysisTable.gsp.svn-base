<%@ page import="daffron.fms.hr.recruiting.JobClassDescription" %>
<%@ page import="daffron.fms.hr.payroll.EmployeePayrollMaster" %>

<table class="report">
    <thead> 
        <tr>
            <th>Company Code</th>
            <th>Division</th>
            <th>Department</th>
            <th>Job Class - Description</th>
            <th>Employees</th>
            <th colspan="2">Minorities</th>
            <th colspan="2">Females</th>
        </tr>
        <tr>
            <th>&#160;</th>
            <th>&#160;</th>
            <th>&#160;</th>
            <th>&#160;</th>
            <th>Total</th>
            <th>Total</th>
            <th>%</th>
            <th>Total</th>
            <th>%</th>
        </tr>
    </thead>
    <tbody>
    <g:each in="${deptList}" status="i" var="row">    
        <g:each in="${JobClassDescription.findAllByDept(row[0])}" status="y" var="jobClass">    
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td>${jobClass?.companyCode}</td>
            <td>${jobClass?.division}</td>
            <td>${row[0]}&#160;-&#160;${jobClass.deptDesc?:'&#160;'}</td>
            <td class="left">${jobClass?.jobClass}&#160;-&#160;${jobClass?.title}</td>
            <% 
                def totalByClass = EmployeePayrollMaster.findAllByJobClass(jobClass?.jobClass)?.size()
                 
                def totalMin = EmployeePayrollMaster.findAllByJobClassAndRaceNotEqual(jobClass?.jobClass, 'W')?.size()
                
                def totalFem = EmployeePayrollMaster.findAllByJobClassAndSex(jobClass?.jobClass, 'F')?.size()
            
                def totalForDept = EmployeePayrollMaster.findAllByDepartment(row[0])?.size()
			
			    def totalMinForDept = EmployeePayrollMaster.findAllByDepartmentAndRaceNotEqual(row[0], 'W')?.size()
			
			    def totalFemForDept = EmployeePayrollMaster.findAllByDepartmentAndSex(row[0], 'F')?.size()
            
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
        <tr class="totals">
            <td colspan="4">Total:</td>
            <td>${totalForDept}</td>
            <td>${totalMinForDept}</td>
            <td>&#160;</td>
            <td>${totalFemForDept}</td>
            <td>&#160;</td>
        </tr>
    </g:each>
    </tbody>
</table>