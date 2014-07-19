<%@ page import="daffron.fms.hr.enrollment.Covered" %>

<g:javascript library="jquery" plugin="jquery"/>
<script type='text/javascript' src='${resource(dir:'js',file:'jquery.autocomplete.min.js')}'></script>
<link rel="stylesheet" type="text/css" href="${resource(dir:'css',file:'jquery.autocomplete.css')}" />

<div id="coveredEditDiv${coveredRowNo}">
<g:form method="post" action="saveCovered" name="coveredEditForm${coveredRowNo}"  id="coveredEditForm${coveredRowNo}">
<table id="coveredTable${coveredRowNo}" class="enrollment"><tbody><tr>

<g:hiddenField name="enroll.id" value="${enroll?.id}" />
<g:hiddenField name="covered.id" value="${covered?.id}" />
<g:hiddenField name="version" value="${covered?.version}" />
<g:hiddenField name="coveredRowNo" value="${coveredRowNo?:params?.coveredRowNo}" />
<g:hiddenField name="changed"/>

<td style="width: 12%;" class="value ${hasErrors(bean: covered, field: 'relationship', 'errors')}">
	<g:if test="${confirmPage}">
		<% out.print(Covered.RELATIONSHIP_TYPES."${covered?.relationship}") %>	
	</g:if>
	<g:else>
		<select name="relationship" id="relationship${coveredRowNo}">
			<option value="">--Relation--</option>
			<g:each in="${Covered.RELATIONSHIP_TYPES}" var="rel">
				<option value="${rel.key}" ${((covered?.relationship==rel.key)?'selected=\"selected\"':'')}>${rel.value}</option>
			</g:each>
		</select>
	</g:else>	
</td>
<td style="width: 13%;" class="value ${hasErrors(bean: covered, field: 'gender', 'errors')}">
	<g:if test="${confirmPage}">
		<g:if test="${covered?.gender=='M'}">
			Male
		</g:if>
		<g:elseif test="${covered?.gender=='F'}">
			Female		
		</g:elseif>
		<g:else>
			&#160;
		</g:else>			
	</g:if>
	<g:else>
		Male: <g:radio name="gender" value="M" checked="${covered?.gender=='M'}"/>
		Female: <g:radio name="gender" value="F" checked="${covered?.gender=='F'}"/>
	</g:else>	
</td>
<td style="width: 21%;" class="value ${hasErrors(bean: covered, field: 'birth', 'errors')}">
	<g:if test="${confirmPage}">
		<g:formatDate format="MM/dd/yyyy" date="${covered?.birth}" />						
	</g:if>
	<g:else>
		<g:datePicker name="birth" value="${covered?.birth}" precision="day"/>
	</g:else>	
</td>
<td style="width: 17%;" class="value ${hasErrors(bean: covered, field: 'name', 'errors')}">
	<g:if test="${confirmPage}">
		${covered?.name}			
	</g:if>
	<g:else>
		<g:textField name="name" id="name${coveredRowNo}" value="${covered?.name}" />
	</g:else>	
</td>
<td style="width: 17%;" class="value ${hasErrors(bean: covered, field: 'ssn', 'errors')}">
	<g:if test="${confirmPage}">
		${covered.ssn}			
	</g:if>
	<g:else>
		<g:if test="${(covered?.ssn)}">
			<span id="ssnReadOnly${coveredRowNo}">
				***-**-${ (covered?.ssn.toString()[5..8])}
				<a id="changeSSN${coveredRowNo}">Change</a>
				<g:hiddenField name="ssn" id="ssn${coveredRowNo}" value="${covered?.ssn}" /> 
			</span>
			<g:javascript>
				$('#changeSSN${coveredRowNo}').click(function() {
					$('#ssnReadOnly${coveredRowNo}').html('<input type="text" name="ssn" id="ssn${coveredRowNo}" size="10" value="${covered?.ssn}"/>');
				});
			</g:javascript>
		</g:if>
		<g:else>
			<g:textField name="ssn" id="ssn${coveredRowNo}"/>
		</g:else>
	</g:else>	 
</td>
<g:if test="${!confirmPage}">
<td>
	 <g:submitToRemote class="update button" action="saveCovered" value="Update" update="coveredEditDiv${coveredRowNo}"/>
	 <g:submitToRemote class="delete button" action="deleteCovered" value="Delete" update="coveredEditDiv${coveredRowNo}" 
	 />
</td>
</g:if>

<g:hasErrors bean="${covered}">
	</tr>
	<tr>
	<td colspan="6">
	    <div class="errors">
			<g:renderErrors bean="${covered}" as="list" />
		</div>
	</td> 
</g:hasErrors>
</tr></tbody></table>
</g:form>
</div>

<g:javascript>
	$("#name${coveredRowNo}").autocomplete(['${enroll.employee.name}']);  // (['zebra','zoo']);
	$("#ssn${coveredRowNo}").autocomplete(['${enroll.employee.socialSecurityNo}']);
	<% if (ajax) { %>  
		$('#relationship${coveredRowNo}').focus();
	<% } %>
	function debugShowFormdata(coveredRowNo) {
		alert($('#coveredEditForm'+coveredRowNo).serialize());
	}
	$('#relationship${coveredRowNo}').change(function () {
		if ($('#relationship${coveredRowNo}').val() == 'I') { // self
	        $.ajax({
	           url: "${createLink(action:'getEmpJSON')}",
	           data: { id: "${enroll.employee.id}" },
	           type: 'POST',
	           success:function(employee) {
	           			$('#name${coveredRowNo}').val(employee.name);
	           			$('#ssn${coveredRowNo}').val(employee.socialSecurityNo);
	           		},
	           error: function(xhr, textStatus, errorThrown) { alert(textStatus); }
	        });
		}		
	});
</g:javascript>