<%@ page import="daffron.fms.hr.enrollment.OtherCoverage" %>
 
 
<g:javascript library="jquery" plugin="jquery"/>
<script type='text/javascript' src='${resource(dir:'js',file:'jquery.autocomplete.min.js')}'></script>
<link rel="stylesheet" type="text/css" href="${resource(dir:'css',file:'jquery.autocomplete.css')}" />
 
<div id="otherCoverageEditDiv${otherCoverageRowNo}">
<g:form method="post" action="saveOtherCoverage" name="otherCoverageEditForm${otherCoverageRowNo}"  id="otherCoverageEditForm${otherCoverageRowNo}">
<table id="otherCoverageTable${otherCoverageRowNo}" class="enrollment">
<tbody>
<tr>

<g:hiddenField name="enroll.id" value="${enroll?.id}" />
<g:hiddenField name="id" value="${otherCoverage?.id}" />
<g:hiddenField name="version" value="${otherCoverage?.version}" />
<g:hiddenField name="otherCoverageRowNo" value="${otherCoverageRowNo?:params?.otherCoverageRowNo}" />

<td class="fourCol value${hasErrors(bean: otherCoverage, field: 'name', 'errors')}">
	<g:if test="${confirmPage}">
		${otherCoverage?.name}
	</g:if>
	<g:else>
		<g:textField name="name" id="otherCoverageName${otherCoverageRowNo}" value="${otherCoverage?.name}" />
	</g:else>	
</td>
<td class="fourCol value${hasErrors(bean: otherCoverage, field: 'carrier', 'errors')}">
	<g:if test="${confirmPage}">
		${otherCoverage?.carrier}		
	</g:if>
	<g:else>
		<g:textField name="carrier" id="otherCoverageCarrier${otherCoverageRowNo}" value="${otherCoverage?.carrier}" />
	</g:else>	
</td>
<td class="fourCol value${hasErrors(bean: otherCoverage, field: 'policyNo', 'errors')}">
	<g:if test="${confirmPage}">
		${otherCoverage?.policyNo}					
	</g:if>
	<g:else>
		<g:textField name="policyNo" id="otherCoveragePolicyNo${otherCoverageRowNo}" value="${otherCoverage?.policyNo}" />
	</g:else>	
</td>
<g:if test="${!confirmPage}">
<td class="fourCol">
	 <g:submitToRemote class="save button" action="saveOtherCoverage" value="Update" update="otherCoverageEditDiv${otherCoverageRowNo}"/> 
	 <g:submitToRemote class="delete button" action="deleteOtherCoverage" value="Delete" update="otherCoverageEditDiv${otherCoverageRowNo}"/>
</td>
</g:if>

<g:hasErrors bean="${otherCoverage}">
	</tr>
	<tr>
	<td colspan="6">
	    <div class="errors">
			<g:renderErrors bean="${otherCoverage}" as="list" />
		</div>
	</td> 
</g:hasErrors>
</tr>
</tbody>
</table>
</g:form>
</div>

<g:javascript>
	$("#otherCoverageName${otherCoverageRowNo}").autocomplete([${enroll.coveredNamesForAutocomplete()}]); // (['zebra','zoo']); 
	<% if (ajax) { %>  
		$('#otherCoverageName${otherCoverageRowNo}').focus();
	<% } %>		
</g:javascript>