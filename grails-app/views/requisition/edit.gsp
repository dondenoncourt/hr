<%@ page import="daffron.fms.hr.recruiting.Approve" %>
<%@ page import="daffron.fms.hr.recruiting.ApproveRequisition" %>
<%@ page import="daffron.fms.hr.recruiting.CompensationTeam" %>
<%@ page import="daffron.fms.hr.recruiting.Requisition" %>
<%@ page import="daffron.fms.hr.recruiting.RequisitionStatus" %>
<%@ page import="daffron.fms.hr.recruiting.JobDescription" %>
<%@ page import="daffron.fms.hr.recruiting.JobClassDescription" %>

<%@ page import="daffron.fms.hr.payroll.EmployeePayrollMaster" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="recruiting" />
        <title>Personnel Requisition</title>
    </head>
    <body>
		<h1> Personnel Requisition </h1>
		<h1> ${req?.status?.id == 'APPROVE' && ApproveRequisition.isApprover(session?.user?.employee, req)!=null?'Approve':'Status: '+RequisitionStatus.get(req.status.id)?.desc}</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${req}">
		<div class="errors">
		    <g:renderErrors bean="${req}" as="list" />
		</div>
		</g:hasErrors>
		<g:form method="post" name="reqForm">
		   <g:hiddenField name="id" value="${req.id}" />
		   <g:hiddenField name="version" value="${req?.version}" />
		   <div class="dialog">
		       <table class="recruitment">
		           <tbody>		           
		               <tr class="prop">
		                   <td valign="top" class="name">
		                     <label for="supervisor">Supervisor:</label>
		                   </td>
		                   <td valign="top" class="value ${hasErrors(bean: req, field: 'supervisor', 'errors')}">
                                <g:if test="${!req.id}">
                                    <g:if test="${session.user?.hrAdmin}">
	                                    <g:textField name="ignor_supervisor" id="supervisor" value="${req?.supervisor}" />
	                                </g:if>
	                                <g:else>
	                                   ${session.user.employee.name} 
	                                </g:else>
			                       	<g:hiddenField name="supervisor.id" id="supervisorId" value="${session.user.employee.id}" />
								</g:if>
								<g:else>
   			                       	${req?.supervisor.name}
								</g:else>
		                   </td>
		               </tr>
		               <tr class="prop">
		                   <td valign="top" class="name">
		                     <label for="department">Department:</label>
		                   </td>
		                   <td valign="top" class="value">
								<g:if test="${!req.id && session.user?.employee?.supervisor}">
								                     	${session.user?.employee?.department}:
								                     	${session.user?.employee?.departmentDescription}
								</g:if>
								<g:else>
								                       	${req?.supervisor?.department}:
								                       	${req?.supervisor?.departmentDescription}
								</g:else> 
								
	                       </td>
		                   </tr>
		               
		                   <tr class="prop">
		                       <td valign="top" class="name">
		                         <label for="jobD"><g:message code="requisition.jobD.label" default="Job Title" />:</label>
		                   </td>
		                   <td valign="top" class="value ${hasErrors(bean: req, field: 'jobD', 'errors')}">
		                       <g:if test="${!req.id}">
			                       <g:select id="jobTitle" name="jobD.id" from="${JobDescription.findAllByProdJobDIsNull(['sort':'jobClass.title'])}" optionKey="id" value="${req?.jobD?.id}"  />
		                       </g:if>
		                       <g:else>
		                          ${JobDescription.get(req?.jobD?.id).jobClass}
		                       </g:else>
		                   </td>
		               </tr>
		
		               <tr class="prop">
		                   <td valign="top" class="name">
		                     <label for="dateNeeded"><g:message code="requisition.dateNeeded.label" default="Date Needed" />:</label>
		                   </td>
		                   <td valign="top" class="value ${hasErrors(bean: req, field: 'dateNeeded', 'errors')}">
		                       <%--<g:datePicker name="dateNeeded" precision="day" value="${req?.dateNeeded}"  />--%>
                	            <daffron:jqDatePicker name="dateNeeded" value="${req?.dateNeeded?g.formatDate(format:'MM/dd/yyyy', date:req?.dateNeeded):''}" class="date"/>
		                   </td>
		               </tr>
		           
		               <tr class="prop">
		                   <td valign="top" class="name">
		                     <label for="noPositions">Number of Positions:</label>
		                   </td>
		                   <td valign="top" class="value ${hasErrors(bean: req, field: 'noPositions', 'errors')}">
		                       <g:textField name="noPositions" value="${fieldValue(bean: req, field: 'noPositions')}" />
		                   </td>
		               </tr>
		           
		               <tr class="prop">
		                   <td valign="top" class="name">
		                     <label for="workSite"><g:message code="requisition.workSite.label" default="Work Site" />:</label>
		                   </td>
		                   <td valign="top" class="value ${hasErrors(bean: req, field: 'workSite', 'errors')}">
		                       <g:textField name="workSite" value="${req?.workSite}" />
		                   </td>
		               </tr>
		           
		               <tr class="prop">
		                   <td valign="top" class="name">
		                     <label>Status:</label>
		                   </td>
		                   <td valign="top" class="value">
		                       Regular
		                       <g:checkBox name="regular" value="${req?.regular}" />
		                       Temporary 
		                       <g:checkBox name="temporary" value="${req?.temporary}" />
		                   </td>
		               </tr>
		               <tr class="prop">
		                   <td/>
		                   <td valign="top" class="value">
		                       Full-Time
		                       <g:checkBox name="fullTime" value="${req?.fullTime}" />
		                       Part-time
		                       <g:checkBox name="partTime" value="${req?.partTime}" />
		                   </td>
		               </tr>
		               
		               <tr class="prop">
		                   <td valign="top" class="name">
		                     <label for="replacing"><g:message code="requisition.replacing.label" default="Replacing" />:</label>
		                   </td>
		                   <td valign="top" class="value ${hasErrors(bean: req, field: 'replacing', 'errors')}">
							<g:if test="${!req.id}">
							     <g:if test="${session.user?.employee?.supervisor}">
			                        <g:select name="replacing.id" 
			                          from="${EmployeePayrollMaster.findAllBySupervisorEmpNo(session.user?.employee.id, ['sort':'name'])}"
			                            optionKey="id" 
			                            value="${req?.replacing}" 
			                            noSelection="${[null:'Select One...']}"/>
			                     </g:if>
			                     <span id="replacingSelect">
			                     </span>
		                    </g:if>
		                    <g:else>
		                       ${req?.replacing?.name}
		                    </g:else>
		                   </td>
		               </tr>
		               
                  	   <g:if test="${req.status.id == 'NEW'}">
			               <g:each in="${Approve.list()}" var="approver" status="iApprover">
				               <tr class="prop">
				                   <td>${iApprover == 0?'Approvers:':''} </td>
				                   <td valign="top" class="value">
				                   <g:hiddenField name="mustOk" value="${approver.mustOk}"/>
				                   <g:if test="${approver.employeeId}">
					                   ${approver.employee.name}
					                   <g:hiddenField name="approver" value="${approver.employeeId}"/>
					               </g:if>
					               <g:else>
					                   ${approver?.jobClassDescription?.title}:&nbsp;
						               <% empsWithJCL = EmployeePayrollMaster.findAllByJobClass(approver.jobClassId) %>
						               <g:select from="${empsWithJCL}" optionKey="id" name="approver"/> 
					               </g:else>
					               
				                   </td>
				               </tr>
			               </g:each>
			               <tr class="prop">
			                   <td>Comp Team Member:</td>
			                   <td valign="top" class="value" >
   				                   <g:hiddenField name="mustOk" value="true"/>
					               <g:select from="${CompensationTeam.findAllByDepartment(session.user.employee.department)}" 
					                  optionKey="employeeId" name="approver" class="compensationTeam"/> 
			                   </td>
			               </tr>
		               </g:if>
		               
		               <g:each in="${req.approvedBy}" var="approver" status="iApprover">
		                  <g:if test="${approver.mustOk}">
			                <tr class="prop">
			                    <td valign="top" class="name">
		                          <g:if test="${approver.approved}">
			                         Approved Date: <g:formatDate format="MM/dd/yyyy" date="${approver.approved}"/>
			                      </g:if>
			                      <g:else>
			                         Must approve:
			                      </g:else>
			                     </td>
			                    <td valign="top" class="value ${hasErrors(bean: req, field: 'replacing', 'errors')}">
			                       ${approver.toString().replaceAll(/\[|\]/,'')}
			                    </td>
			                </tr>
			              </g:if>
		               </g:each>
		               
		               <g:if test="${req.id}">
		                   <tr class="prop">
		                       <td valign="top" class="name">
		                         <label for="status">Status:</label>
			                   </td>
			                   <td valign="top" class="value">
			                       <g:select id="status" name="status.id" 
			                                 from="${RequisitionStatus.activeStatuses()}" 
			                                 optionKey="id" 
			                                 value="${req?.status.id}"  
			                       />
			                   </td>
			               </tr>
			           </g:if>
			           <g:else>
						   <g:hiddenField name="status.id" value="${req?.status?.id}" />
			           </g:else>
		           
		           </tbody>
		       </table>
		   </div>
		   <div class="linkBtns buttons">
		<g:link class="list button" action="list" controller="requisition" title="Requisition List">Req List</g:link>
		<g:if test="${req.id && req.status.id == 'APPROVE' && ApproveRequisition.isApprover(session?.user?.employee, req)}">
            <g:actionSubmit class="save button" action="approve" value="Approve" />
        </g:if>
		<g:if test="${['edit','create'].find{action == it}}">
	        <g:actionSubmit class="save button" action="${req.id?'update':'save'}" value="${reqid?'Update':'Save'}" />
			<g:if test="${req.id} && session.user?.hrAdmin">
	        	<g:actionSubmit class="delete button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
	        </g:if>
		 </g:if>
		   </div>
		</g:form>
		
        <g:if test="${!params.pdf}">
			<g:javascript>
                $('#regular').click(function () { if ($(this).is(':checked')) { $('#temporary').attr('checked', false); } });
                $('#temporary').click(function () { if ($(this).is(':checked')) { $('#regular').attr('checked', false); } });
                $('#partTime').click(function () { if ($(this).is(':checked')) { $('#fullTime').attr('checked', false); } });
                $('#fullTime').click(function () { if ($(this).is(':checked')) { $('#partTime').attr('checked', false); } });
				$('#reqForm').submit(function() {
					if (!$('#regular').is(':checked') && !$('#temporary').is(':checked')) {
						alert('Please select regular or temporary');
						return false;
					}
					if (!$('#partTime').is(':checked') && !$('#fullTime').is(':checked')) {
						alert('Please select Part-Time of Full-Time');
						return false;
					}
					return true;
				});
			    function getSuperNames(request, response) {
		            $.ajax({
		                url: "${createLink(action:'supervisorNames')}", 
		                data: "name="+request.term,
		                type: "POST",
		                dataFilter: function(data) { return data; },
		                success: function(data) {response($.map(data, function(item) {return {value: item.name}}))},
		                error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
		            });
			    }
			    $("#supervisor").blur(function() {
		            $.ajax({
		                url: "${createLink(action:'empNoByName')}", 
		                data: "name="+$(this).val(),
		                type: "POST",
		                success: function(data) { 
		                  $('#supervisorId').val(data);
		                  if (data.length > 0) {
			                 replaceSelect(data);
			              }
		                },
		                error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
		            });
			    });
			    
			    $("#supervisor").autocomplete({
			        source: getSuperNames,
			        minLength: 1
			    });
			    function replaceSelect(id) {
		            $.ajax({
		                url: "${createLink(action:'superEmployees')}", 
		                data: "id="+id,
		                type: "POST",
		                success: function(data) { $('#replacingSelect').html(data); },
		                error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
		            });
		            $.ajax({
		                url: "${createLink(action:'superCompensationTeam')}", 
		                data: "id="+id,
		                type: "POST",
		                success: function(data) { $('select.compensationTeam').html(data);},
		                error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
		            });
		                  
			    }
				// sort job titles (easier here than in a domain finder as title is in a nested class)
				var soptions = $.makeArray($('#jobTitle option')).sort(function(a, b) {
				    return a.text == b.text ? 0 : a.text < b.text ? -1 : 1
				});
				$('#jobTitle').html(soptions);
                $(".date" ).datepicker(); // jquery datePicker init
          
			    <g:if test="${action == 'show'}">
			      $('form input').attr('disabled', true);
			      $('form .buttons input').attr('disabled', false);
			      $('#id').attr('disabled', false); // so edit button passes ID
			    </g:if>
			</g:javascript>
		</g:if>
    </body>
</html>
