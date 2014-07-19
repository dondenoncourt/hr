<dl class="twocol">
	<dt class="name">Position</dt><dd class="value">  
       <select name="${pafType}.position">
            <option value="0">Select One...</option>
            <g:each in="${jobDescList}" var="job"> 
                <option value="${job.id}" ${pafValue?.position == job.id?'selected=selected':''}>${job.jobClass.title}</option>
            </g:each>
       </select>
    </dd>
	<dt class="name">Department</dt><dd class="value">
		<%  if (use_GL_Departments) { %>
	       <select name="${pafType}.department">
	            <option value="0">Select One...</option>
	            <g:each in="${deptList}" var="dept"> 
	                <option value="${dept.departmentCode}" ${pafValue?.department == dept.departmentCode?'selected=selected':''}>${dept.description}</option>
	            </g:each>
	       </select>
		<% } else { %>
	       <select name="${pafType}.department">
	            <option value="0">Select One...</option>
	            <g:each in="${deptList}" var="dept"> 
				    <g:if test="${dept.value ==~ /^\d+$/}">
		                <option value="${dept.value}" ${pafValue?.department.toString() == dept.value?'selected=selected':''}>${dept.descOfValue}</option>
					</g:if>
	            </g:each>
	       </select>
	    <% } %>
	</dd>
	<dt class="name">Sub-department</dt><dd class="value">
		<%  if (use_Sub_GL_Departments) { %>
	       <select name="${pafType}.subDepartment">
	            <option value="0">Select One...</option>
	            <g:each in="${subDeptList}" var="dept"> 
	                <option value="${dept.subDeptCode}" ${pafValue?.subDepartment == dept.subDeptCode?'selected=selected':''}>${dept.description}</option>
	            </g:each>
	       </select>
		<% } else { %>
	       <select name="${pafType}.subDepartment">
	            <option value="0">Select One...</option>
	            <g:each in="${subDeptList}" var="dept"> 
				    <g:if test="${dept.value ==~ /^\d+$/}">
					   <option value="${dept.value}" ${pafValue?.subDepartment.toString() == dept.value?'selected=selected':''}>${dept.descOfValue}</option> 
					</g:if>
	            </g:each>
	       </select>
	    <% } %>
	</dd>
	<dt class="name">Replacing</dt><dd class="value">
       <select name="${pafType}.replacingEmpNo">
            <option value="0">Select One...</option>
            <g:each in="${empList}" var="emp"> 
                <option value="${emp.id}" ${pafValue?.replacingEmpNo == emp.id?'selected=selected':''}>${emp.name}</option>
            </g:each>
       </select>
	</dd>
	<dt class="name">Wage/Salary</dt><dd class="value">${g.textField(name:pafType+'.wageSalary', value:pafValue?.wageSalary)}</dd>
	<dt class="name">Wage/Salary Period</dt><dd class="value">${g.textField(name:pafType+'.wageSalaryPeriod', value:pafValue?.wageSalaryPeriod)}</dd>
	<dt class="name">Grade</dt><dd class="value">${g.textField(name:pafType+'.grade', value:pafValue?.grade)}</dd>
	<dt class="name">Use Vacation</dt><dd class="value">${g.checkBox(name:pafType+'.useVacation', value:pafValue?.useVacation)}</dd>
	<dt class="name">Sick Leave</dt><dd class="value">${g.checkBox(name:pafType+'.sickLeave', value:pafValue?.sickLeave)}</dd>
	<dt class="name">Vacation Code</dt><dd class="value">${g.textField(name:pafType+'.vacationCode', value:pafValue?.vacationCode)}</dd>
	<dt class="name">EEOC</dt><dd class="value">${g.textField(name:pafType+'.eeoc', value:pafValue?.eeoc)}</dd>
	<dt class="name">Inside/Outside</dt><dd class="value">${g.textField(name:pafType+'.insideOutside', value:pafValue?.insideOutside)}</dd>
	<dt class="name">Savings401k</dt><dd class="value">${g.textField(name:pafType+'.savings401k', value:pafValue?.savings401k)}</dd>
	<dt class="name">RS Pension</dt><dd class="value">${g.textField(name:pafType+'.rsPension', value:pafValue?.rsPension)}</dd>
	<dt class="name">BCBS</dt><dd class="value">${g.textField(name:pafType+'.bcbs', value:pafValue?.bcbs)}</dd>
	<dt class="name">Full-time</dt><dd class="value">${g.checkBox(name:pafType+'.fullTime', value:pafValue?.fullTime)}</dd>
	<dt class="name">Part-time Hours</dt><dd class="value">${g.textField(name:pafType+'.partTimeHours', value:pafValue?.partTimeHours)}</dd>
	<dt class="name">Temp</dt><dd class="value">${g.checkBox(name:pafType+'.temp', value:pafValue?.temp)}</dd>
</dl>
