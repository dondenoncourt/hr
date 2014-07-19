<%@ page import="daffron.fms.hr.recruiting.Approve" %>
<%@ page import="daffron.fms.hr.recruiting.JobClassDescription" %>
<%@ page import="daffron.fms.hr.payroll.EmployeePayrollMaster" %>


<p>Select by</p>
<div class="fieldcontain ${hasErrors(bean: approveInstance, field: 'employeeId', 'error')} required">
	<label for="employeeId">
		Employee Name:
	</label>
    <g:textField name="ignor_name" value="${approveInstance?(EmployeePayrollMaster.get(approveInstance?.employeeId)?.name):''}" />
	<g:hiddenField name="employeeId" value="${approveInstance.employeeId}"/>
</div>
<p>or by </p>
<div class="fieldcontain ${hasErrors(bean: approveInstance, field: 'jobClassId', 'error')} ">
	<label for="jobClassId">
	   Job Class:
	</label>
	<g:select from="${JobClassDescription.list()}" name="jobClassId" optionKey="id" value="${approveInstance?.jobClassId}"
        noSelection="${['null':'Select a job class description'] }"
    />
</div>
<div class="fieldcontain ${hasErrors(bean: approveInstance, field: 'mustOk', 'error')} ">
	<label for="mustOk">
		<g:message code="approve.mustOk.label" default="Must Ok" />
	</label>
	<g:checkBox name="mustOk" value="${approveInstance?.mustOk}" />
</div>

<g:javascript>
   $("#ignor_name").autocomplete({
       source: getEmpNames,
       minLength: 1
   });
   $('#ignor_name').blur(function (){
	    $.ajax({
	        url: "${createLink(controller:'employee', action:'empNoByName')}", 
	        data: "name="+$('#ignor_name').val(),
	        type: "POST",
	        success: function(data) { $('#employeeId').val(data); },
	        error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
	    });
   });
   function getEmpNames(request, response) {
          $.ajax({
              url: "${createLink(controller:'employee', action:'empNames')}", 
              data: "name="+request.term,
              type: "POST",
              dataFilter: function(data) { return data; },
              success: function(data) {response($.map(data, function(item) {if (this.debug) console.log(item.jobClass);return {value: item.name}}))},
              error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
          });
   }
</g:javascript>