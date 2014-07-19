<%@ page import="daffron.fms.hr.enrollment.Beneficiary" %>
            
<fieldset>
	<legend>${beneType.value} Beneficiary Info</legend>
	<table id="beneficiaryTable" class="enrollment">
		<thead>
			<tr>
				<th style="width: 13%;">Name</th>
				<th style="width: 12%;">Relationship</th>
				<th style="width: 21%;">Birth Date</th>
				<th style="width: 17%;">Soc Sec#</th>
				<th style="width: 17%;">Share %</th>
				<g:if test="${!confirmPage}">
					<th style="width: 20%;">Action</th>
				</g:if>
				<g:else>
					&#160;
				</g:else>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="6">
					<g:each in="${enroll.beneficiaries.findAll{it.type == beneType.key && !it.sameAsPrimary}}" var="beneficiary" status="beneficiaryRowNo">
						<g:render template="beneficiaryEdit" model="[beneficiary:beneficiary, beneficiaryRowNo:beneficiaryRowNo, confirmPage:confirmPage, beneType:beneType.key]"/>
					</g:each>
				</td>
			</tr>
		</tbody>
	</table>
	<g:if test="${!confirmPage}">
	<div class="add">
	    <a href="#" class="promptNewPriBeneficiary add button" beneType="${beneType.key}">Add</a>
	    <g:if test="${beneType.key == 'NRECA'}">
	    	&nbsp; &nbsp;
		    Same as Primary Plan
		    <g:checkBox ox" id="sameAsPrimary" value="${enroll.beneficiaries.find{it.type == beneType.key && it.sameAsPrimary}?true:false}"/> 
	    </g:if>
    </div>
	</g:if>		
</fieldset>	