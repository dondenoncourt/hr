<%@ page import="daffron.fms.hr.enrollment.Medicare" %>
 
 
<g:javascript library="jquery" plugin="jquery"/>
<script type='text/javascript' src='${resource(dir:'js',file:'jquery.autocomplete.min.js')}'></script>
<link rel="stylesheet" type="text/css" href="${resource(dir:'css',file:'jquery.autocomplete.css')}" />
 
<div id="medicareEditDiv${medicareRowNo}">
<g:form method="post" action="saveMedicare" name="medicareEditForm${medicareRowNo}"  id="medicareEditForm${medicareRowNo}">
<table id="medicareTable${medicareRowNo}" class="enrollment">
<tbody>
<tr>

 
<g:hiddenField name="enroll.id" value="${enroll?.id}" />
<g:hiddenField name="id" value="${medicare?.id}" />
<g:hiddenField name="version" value="${medicare?.version}" />
<g:hiddenField name="medicareRowNo" value="${medicareRowNo?:params?.medicareRowNo}" />

<td class="fiveCol value${hasErrors(bean: medicare, field: 'name', 'errors')}">
	<g:if test="${confirmPage}">
		${medicare?.name}						
	</g:if>
	<g:else>
		<g:textField name="name" id="medicareName${medicareRowNo}" value="${medicare?.name}" />
	</g:else>	
</td>
<td class="fiveCol value${hasErrors(bean: medicare, field: 'policyNo', 'errors')}">
	<g:if test="${confirmPage}">
		${medicare?.policyNo}					
	</g:if>
	<g:else>
		<g:textField name="policyNo" id="medicarePolicyNo${medicareRowNo}" value="${medicare?.policyNo}" />
	</g:else>	
</td>
<td style="width: 21%;" class="value${hasErrors(bean: medicare, field: 'effective', 'errors')}">
	<g:if test="${confirmPage}">
		${medicare?.effective}				
	</g:if>
	<g:else>
		<g:datePicker name="effective" value="${medicare?.effective}" precision="day"/>
	</g:else>	
</td>
<td style="width: 19%;" class="value${hasErrors(bean: medicare, field: 'type', 'errors')}">
	<g:if test="${confirmPage}">
		<% out.print(Medicare.TYPE_MAP."${medicare?.type}") %>	
	</g:if>
	<g:else>
		<select name="type">
			<option value="">--Relation--</option>
			<g:each in="${Medicare.TYPE_MAP}" var="rel">
				<option value="${rel.key}" ${((medicare?.type==rel.key)?'selected=selected':'')}>${rel.value}</option>
			</g:each>
		</select>
	</g:else>	
</td>
<g:if test="${!confirmPage}">
<td class="fiveCol">
	 <g:submitToRemote class="save button" action="saveMedicare" value="Update" update="medicareEditDiv${medicareRowNo}"/> 
	 <g:submitToRemote class="delete button" action="deleteMedicare" value="Delete" update="medicareEditDiv${medicareRowNo}"/>
</td>
</g:if>

<g:hasErrors bean="${medicare}">
	</tr>
	<tr>
	<td colspan="6">
	    <div class="errors">
			<g:renderErrors bean="${medicare}" as="list" />
		</div>
	</td> 
</g:hasErrors>
</tr>
</tbody>
</table>
</g:form>
</div>

<g:javascript>
	$("#medicareName${medicareRowNo}").autocomplete([${enroll.coveredNamesForAutocomplete()}]); // (['zebra','zoo']); 
	<% if (ajax) { %>  
		$('#medicareName${medicareRowNo}').focus();
	<% } %>
</g:javascript>