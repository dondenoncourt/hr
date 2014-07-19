<%@ page import="daffron.fms.hr.payroll.SalaryHistory" %>
<%@ page import="daffron.fms.hr.payroll.PrCodes" %>

<table class="report">
    <thead> 
        <tr>
        	<g:if test="${params.pdf || params.excel}">
        		<th class="mid">Name</th>
        	</g:if>
        	<g:else>
        		<g:sortableColumn property="name" title="Name" class="mid" />     
       		</g:else>   	
   	        <th class="mid sortable ${params.sort=='hireDate'?'sorted '+(params.order=='asc'?'desc':'asc'):''}">
			 	<g:if test="${params.pdf || params.excel}">
			 		YOS
   	        	</g:if>	
   	        	<g:else>
   	        		<a href="${createLink(action:'yearsOfService')}?sort=hireDate&order=${params.order=='asc'?'desc':'asc'}">YOS</a>
   	        	</g:else>
   	        </th>
   	        <th class="mid">Age</th>
   	        <th class="mid">SSN</th>
   	        <th class="mid">M/S</th>
   	        <th class="mid">Job Position</th>
   	        <th class="mid">Effective Date</th>
        </tr>
    </thead>
    <tbody>
    <% def now = new java.util.Date() %>		
    <g:each in="${payrollList}" status="i" var="emp">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">        	
            <td class="text">${emp?.name}</td>
            <td class="num">
            	<g:if test="${emp?.adjustedHireDate!=null}">
            		<g:if test="${params.pdf || params.excel}">
	            		* ${(emp?.adjustedHireDate?(((now - emp.adjustedHireDate)/365.25).setScale(1, BigDecimal.ROUND_HALF_UP)):0)}
       		   		</g:if>
       		   		<g:else>
       		   			<a href="#" 
	            		   onclick="alert('Adjusted Hire Date: ${emp?.adjustedHireDate}\nHire Date: ${emp?.hireDate}'); return false">
	            		   *&#160;${(emp?.adjustedHireDate?(((now - emp.adjustedHireDate)/365.25).setScale(1, BigDecimal.ROUND_HALF_UP)):0)}           		   		
	       		   		</a>
       		   		</g:else>
            	</g:if>
            	<g:else>
            		${(emp?.hireDate?(((now - emp.hireDate)/365.25).setScale(1, BigDecimal.ROUND_HALF_UP)):0)}
           		</g:else> 
       		</td>           
            <td class="num">${(emp?.birthDate?(((now - emp.birthDate)/365.25).setScale(0, BigDecimal.ROUND_HALF_DOWN)):0)}</td>
            <td class="mid">
            	<g:if test="${emp?.socialSecurityNo!=0}">
            		<daffron:formatSSN ssn="${emp?.socialSecurityNo?.toString()}" />
            	</g:if>
            	<g:else>
            		&#160;
            	</g:else>
           	</td>
            <td class="mid">${emp?.maritalStatus}</td>              
           	<td class="text">${PrCodes.findByFieldAndValue('JOB', emp?.jobClass)?.descOfValue ?: '&#160;'}</td>
            <%
				def hist = SalaryHistory.findAllByEmpNo(emp?.empNo, [sort:'salHistPayDate', order:'desc'])
				boolean prior = hist?.size() as boolean
			%>
            <td class="mid">
            	<% if (prior) { %>
                    	<g:formatDate date="${hist[0]?.salHistPayDate}" format="yyyy-MM-dd"/>
				<% } else { %>
					${emp?.hireDate}
				<% } %>
			</td>
        </tr>
    </g:each>    
	<g:if test="${params.excel}">
		<tr>
			<td colspan="7">* - Adjusted Hire Date</td>
		</tr>
	</g:if>
    </tbody>
</table>
<g:if test="${params.pdf}">
	<br /><br />
	* - Adjusted Hire Date
</g:if>