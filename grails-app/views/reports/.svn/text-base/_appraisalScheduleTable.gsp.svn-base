<%@ page import="daffron.fms.hr.payroll.SalaryHistory" %>
<%@ page import="daffron.fms.hr.recruiting.JobClassDescription" %>
<%@ page import="daffron.fms.hr.payroll.EmployeePayrollMaster" %>

<table class="report">
    <thead> 
        <tr>
            <g:if test="${params.pdf || params.excel}">
                <th class="mid">Emp No.</th>
                <th class="mid">Employee Name</th>
            </g:if>
            <g:else>
                <g:sortableColumn property="id" title="Emp No" class="mid" />     
                <g:sortableColumn property="name" title="Employee Name" class="mid" />     
            </g:else> 
            <th class="mid">Scheduled Review Date</th>
            <th class="mid">Effective Date</th>
            <th class="mid">Title</th>
            <th class="mid">Pay Rate</th>
            <th class="mid">Pay Type</th>
            <th class="mid">Salary History Trans Type</th>
        </tr>
    </thead>
    <tbody>
    <% def now = new java.util.Date() %>   
    <g:each in="${appraisalList}" status="i" var="row">  
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td>${row.id}</td>
            <td>${row.name}</td>
            <td>${row.scheduledReviewDate}</td>
            <td>${row.payDate}</td>
            <td>${row.jobClass} ${JobClassDescription.get(row.jobClass)}</td>
            <td>${row.payRate}</td>
            <td>${row.payType}</td>
            <td>${row.salaryHistoryTransType}</td>
        </tr>  
        <g:each in="${SalaryHistory.findAllByEmpNo(row?.id, [sort: "salHistPayDate", order: "desc"])}" status="y" var="sal">
	        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}"> 
	            <td>&#160;</td>
	            <td>&#160;</td>
	            <td>not available</td>
	            <td>${sal?.salHistPayDate?:'&#160;' }</td>
	            <td>${sal?.jobClass?sal?.jobClass+'- '+(JobClassDescription.get(sal?.jobClass?:' ')?:''):'&#160;'}</td>
	            <td>${sal?.salHistSalHistpayRate}</td>
	            <td>${sal?.salHistPayType == 'H' ? 'H - Hourly' : 'S - Salary'}</td>
	            <td>${sal?.transactionType}</td>
	        </tr>
	   </g:each> 
    </g:each>
    </tbody>
</table>