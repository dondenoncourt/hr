<%@ page import="daffron.fms.hr.enrollment.Beneficiary" %>

<g:if test="${!confirmPage}">								
<div id="beneEditDiv_${beneType}_${beneficiaryRowNo}">
   	<form action="${createLink(action:'saveBeneficiary')}" method="post" 
   		name="beneForm_${beneType}_${beneficiaryRowNo}"  
   		id="beneForm_${beneType}_${beneficiaryRowNo}" >
			<g:hiddenField name="id" value="${beneficiary?.id}" /> 
			<g:hiddenField name="enroll.id" value="${beneficiary?.enroll.id}" /> 
			<g:hiddenField name="changed"/>
			<g:hiddenField name="beneficiary.id" value="${beneficiary?.id}" />
			<g:hiddenField name="type" value="${beneficiary?.type}" />
			<g:hiddenField name="version" value="${beneficiary?.version}" />
			<g:hiddenField name="beneficiaryRowNo" value="${beneficiaryRowNo?:params?.beneficiaryRowNo}" />
				
</g:if>
	<table id="beneTable${beneficiaryRowNo}" class="enrollment">
		<tbody>
			<tr>
				<td style="width: 13%" class="value ${hasErrors(bean: beneficiary, field: 'name', 'errors')}">
					<g:if test="${confirmPage}">
						${beneficiary?.name}
					</g:if>
					<g:else>
						<g:textField name="name" id="name${beneficiaryRowNo}" value="${beneficiary?.name}"  size="10"/>
					</g:else>
				</td>
				<td style="width: 12%" class="mid value ${hasErrors(bean: beneficiary, field: 'relationship', 'errors')}">
					<g:if test="${confirmPage}">
						<% out.print(Beneficiary.RELATIONSHIP_TYPES."${beneficiary?.relationship}") %>
					</g:if>
					<g:else>
						<select name="relationship" id="relationship${beneficiaryRowNo}">
							<option value="">--Relation--</option>
							<g:each in="${Beneficiary.RELATIONSHIP_TYPES}" var="rel">
								<option value="${rel.key}" ${((beneficiary?.relationship==rel.key)?'selected=\"selected\"':'')}>${rel.value}</option>
							</g:each>
						</select>
					</g:else>
				</td>
				<td style="width: 21%;" class="value ${hasErrors(bean: beneficiary, field: 'birth', 'errors')}">	
					<g:if test="${confirmPage}">
						<g:if test="${beneficiary?.birth}">
							<g:formatDate value="${beneficiary?.birth}" format="MM/dd/yyyy" />
						</g:if>
						<g:else>
							&#160;
						</g:else>		
					</g:if>
					<g:else>
						<g:datePicker name="birth" value="${beneficiary?.birth}" precision="day"/>
					</g:else>
				</td>

				<td style="width: 17%;" class="num value ${hasErrors(bean: beneficiary, field: 'ssn', 'errors')}">
					<g:if test="${confirmPage}">
						<g:if test="${(beneficiary?.ssn)}">
							<span id="ssnReadOnly${beneficiaryRowNo}">
								***-**-${ (beneficiary?.ssn.toString()[5..8])}
							</span>
						</g:if>
						<g:else>
							&#160;
						</g:else>
					</g:if>
					<g:else>
						<g:if test="${(beneficiary?.ssn)}">
							<span id="ssnReadOnly${beneficiaryRowNo}">
								***-**-${ (beneficiary?.ssn.toString()[5..8])}
								<a id="changeSSN${beneficiaryRowNo}">Change</a>
								<g:hiddenField name="ssn" id="ssn${beneficiaryRowNo}" value="${beneficiary?.ssn}" /> 
							</span>
							<g:javascript>
								$('#changeSSN${beneficiaryRowNo}').click(function() {
									$('#ssnReadOnly${beneficiaryRowNo}').html('<input type="text" name="ssn" id="ssn${beneficiaryRowNo}" size="10" value="${beneficiary?.ssn}"/>');
								});
							</g:javascript>
						</g:if>
						<g:else>
							<g:textField name="ssn" id="ssn${beneficiaryRowNo}" /> 
						</g:else>
					</g:else>
				</td>
				
			<td style="width: 17%;" class="num value ${hasErrors(bean: beneficiary, field: 'share', 'errors')}">	
				<g:if test="${confirmPage}">
					${beneficiary?.share}
				</g:if>
				<g:else>
					<g:textField name="share" id="share${beneficiaryRowNo}" value="${beneficiary?.share as Integer}" class="share_${beneType}" size="4"/>
				</g:else>
			</td>
			
			<g:if test="${!confirmPage}">
				<td style="width: 20%;">
					<input id="beneUpd_${beneType}_${beneficiaryRowNo}" type="button" value="Update" class="save button"/>
					<input id="beneDlt_${beneType}_${beneficiaryRowNo}" type="button" value="Delete" class="delete button"/>
					 <g:javascript>
					 	$('#beneUpd_${beneType}_${beneficiaryRowNo}').click(function () {
					 		$.ajax({
						 		url: "${createLink(action:'saveBeneficiary')}",
					 			type:'POST',
					 			data:$('#beneForm_${beneType}_${beneficiaryRowNo}').serialize(), 
					 			success:function(data,textStatus){
					 				$('#beneEditDiv_${beneType}_${beneficiaryRowNo}').html(data);}
						 	});
					 	});
					 	$('#beneDlt_${beneType}_${beneficiaryRowNo}').click(function () {
					 		$.ajax({
						 		url: "${createLink(action:'deleteBeneficiary')}",
					 			type:'POST',
					 			data:$('#beneForm_${beneType}_${beneficiaryRowNo}').serialize(), 
					 			success:function(data,textStatus){
					 				$('#beneEditDiv_${beneType}_${beneficiaryRowNo}').html(data);},
					 			error:function(XMLHttpRequest,textStatus,errorThrown){alert(textStatus);}
						 	});
					 	});
					 </g:javascript>
				</td>
			</g:if>
		</tr>
	</tbody>
</table>					
<g:if test="${!confirmPage}">
</form>
</div>
</g:if>				
<g:if test="${!confirmPage}">
	<g:hasErrors bean="${beneficiary}">
		<tr>
			<td colspan="6">
		  	  <div class="errors">
					<g:renderErrors bean="${beneficiary}" as="list" />
				</div>
			</td> 
		</tr>
	</g:hasErrors>
</g:if>

<g:if test="${!confirmPage}">
	<g:javascript>
		<% if (ajax) { %>  
			$('#relationship${beneficiaryRowNo}').focus();
		<% } %>
		$('#relationship${beneficiaryRowNo}').change(function () {
			if ($('#relationship${beneficiaryRowNo}').val() == 'I') { // self
		        $.ajax({
		           url: "${createLink(action:'getEmpJSON')}",
		           data: { id: "${enroll.employee.id}" },
		           type: 'POST',
		           success:function(employee) {
		           			$('#name${beneficiaryRowNo}').val(employee.name);
		           			$('#ssn${beneficiaryRowNo}').val(employee.socialSecurityNo);
		           		},
		           error: function(xhr, textStatus, errorThrown) { alert(textStatus); }
		        });
			}		
		});
	   enrollConfirmToUpdateSubmitText();
	</g:javascript>
</g:if>