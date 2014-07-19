<fieldset>
	<legend>Un-Reimbursed Medical FSA (URM) -- $1,800 Annual Maximum:</legend>
	<div style="margin: 5px 0 10px 5px;">
		<b>Waive Coverage:</b>&#160;&#160;
		<g:if test="${confirmPage}">
			<g:if test="${enroll?.cafeteria?.urmWaive}">
				<img src="${resource(dir:'images',file:'checkmark.gif')}" alt="Coverage Waived" width="20" height="15" />
			</g:if>
		</g:if>
		<g:else>
			<g:checkBox name="cafeteria.urmWaive" value="${enroll?.cafeteria?.urmWaive}" alias="urmWaive" />
		</g:else>
	</div>
	<table class="enrollment">
		<thead>
	 		<tr>
			    <th class="fiveCol num"><label for="urmBalancePrior">2011 Account Balance:</label></th>
			    <th class="fiveCol num"><label for="urmElectionPrior">2011 Annual Election:</label></th>
			    <th class="fiveCol num"><label for="urmDeductionPrior">2011 Per Pay:</label></th>
			  	<th class="fiveCol num"><label for="urmElection">2012 Annual Election:</label></th>
			    <th class="fiveCol num"><label for="urmDeduction">2012 PerPay:</label></th>
	 		</tr>
	 	</thead>
	  	<tbody>
			<tr>
				<td class="num">
					<g:formatNumber number="${enroll?.cafeteria?.urmBalancePrior?:0}" format="###,##0" /> 
				</td>
			    <td class="num">
			    	<g:formatNumber number="${enroll?.cafeteria?.urmElectionPrior?:0}" format="###,##0" />
		    	</td>
			    <td class="num">
			    	<g:formatNumber number="${enroll?.cafeteria?.urmDeductionPrior?:0}" format="###,##0" />
		    	</td>
			    <td class="num ${hasErrors(bean: cafeteria, field: 'urmElection', 'errors')}">
			    	<g:if test="${confirmPage}">
			    		${enroll?.cafeteria?.urmElection}
			    	</g:if>
			    	<g:else>
			    		<g:textField name="cafeteria.urmElection" value="${enroll?.cafeteria?.urmElection as Integer}" id="urmElec" size="11"/>
			    	</g:else>
			    </td>
			    <td class="num ${hasErrors(bean: cafeteria, field: 'urmDeduction', 'errors')}">
			    	<g:if test="${confirmPage}">
			    		${enroll?.cafeteria?.urmDeduction}
			    	</g:if>
			    	<g:else>
			    		<g:textField name="cafeteria.urmDeduction" value="${enroll?.cafeteria?.urmDeduction as Integer}" id="urmDed" size="11"/>
			    	</g:else>
			    </td>
		  	</tr>
	 	</tbody>
 	</table>
</fieldset>

<fieldset>
	<legend>Dependent Care FSA (DDC) -- $5,000 Annual Maximum</legend>
	<div style="margin: 5px 0 10px 5px;">
		<b>Waive Coverage:</b>&#160;&#160;
		<g:if test="${confirmPage}">
			<g:if test="${enroll?.cafeteria?.ddcWaive}">
				<img src="${resource(dir:'images',file:'checkmark.gif')}" alt="Coverage Waived" width="20" height="15" />
			</g:if>
		</g:if>
		<g:else>
			<g:checkBox name="cafeteria.ddcWaive" value="${enroll?.cafeteria?.ddcWaive}" alias="ddcWaive" />
		</g:else>
	</div>
 	<table class="enrollment">
 	<thead>
 		<tr>
		    <th class="fiveCol num"><label for="ddcBalancePrior">2011 Account Balance:</label></th>
		    <th class="fiveCol num"><label for="ddcElectionPrior">2011 Election:</label></th>
		    <th class="fiveCol num"><label for="ddcDeductionPrior">2011 Per Pay:</label></th>
		  	<th class="fiveCol num"><label for="ddcElection">2012 Annual Election:</label></th>
		    <th class="fiveCol num"><label for="ddcDeduction">2012 PerPay:</label></th>
 		</tr>
 	</thead>
 	<tbody>
  	<tr>
	    <td class="num">
	    	<g:formatNumber number="${enroll?.cafeteria?.ddcBalancePrior?:0}" format="###,##0" />
    	</td>
	    <td class="num">
	    	<g:formatNumber number="${enroll?.cafeteria?.ddcElectionPrior?:0}" format="###,##0" />
    	</td>
	    <td class="num">
	    	<g:formatNumber number="${enroll?.cafeteria?.ddcDeductionPrior?:0}" format="###,##0" />
    	</td>
	    <td class="num ${hasErrors(bean: cafeteria, field: 'ddcElection', 'errors')}">
	    	<g:if test="${confirmPage}">
	    		${enroll?.cafeteria?.ddcElection}
	    	</g:if>
	    	<g:else>
	    		<g:textField name="cafeteria.ddcElection" value="${enroll?.cafeteria?.ddcElection as Integer}" id="ddcElec" size="11"/>
	    	</g:else>
    	</td>
	    <td class="num ${hasErrors(bean: cafeteria, field: 'ddcDeduction', 'errors')}">
	    	<g:if test="${confirmPage}">
	    		${enroll?.cafeteria?.ddcDeduction}
	    	</g:if>
	    	<g:else>
	    		<g:textField name="cafeteria.ddcDeduction" value="${enroll?.cafeteria?.ddcDeduction as Integer}" id="ddcDed" size="11"/>
	    	</g:else>
    	</td>
  	</tr>
  </tbody>
</table>
</fieldset>

<fieldset>
	<legend>FSA Reimbursement Method Choice</legend>
	<div style="margin: 5px 0 10px 5px;">
		<g:if test="${confirmPage}">
			<g:if test="${enroll?.cafeteria?.fsaRepayMethod == 'D'}">
				Direct Deposit
			</g:if>
			<g:elseif test="${enroll?.cafeteria?.fsaRepayMethod == 'M'}">
				Mail
			</g:elseif>
			<g:elseif test="${enroll?.cafeteria?.fsaRepayMethod == null}">
				None Selected
			</g:elseif>
		</g:if>
		<g:else>
			<b>Direct Deposit:</b> <g:radio name="cafeteria.fsaRepayMethod" alias="fsaRepayMethod" value="D" checked="${enroll?.cafeteria?.fsaRepayMethod == 'D'}"/>
			<b>Mail:</b> <g:radio name="cafeteria.fsaRepayMethod" alias="fsaRepayMethod" value="M" checked="${enroll?.cafeteria?.fsaRepayMethod == 'M'}"/>
		</g:else>
	</div>
	<br /><br />
	<div id="directDeposit">
		<table class="enrollment">
			<thead>
				<tr>
					<th class="fourCol"><label for="fsaBankName">Bank Name:</label></th>
					<th class="fourCol num"><label for="fsaRoutingNo"><b>Routing#:</b></label></th>
					<th class="fourCol num"><label for="fsaActNo"><b>Account#:</b></label></th>
					<th class="fourCol">Account Type:</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<g:if test="${confirmPage}">
							${enroll?.cafeteria?.fsaBankName}
						</g:if>
						<g:else>
							<g:textField name="cafeteria.fsaBankName" value="${enroll?.cafeteria?.fsaBankName}"/>
						</g:else>
					</td>
					<td class="num">
						<g:if test="${confirmPage}">
							${enroll?.cafeteria?.fsaRoutingNo}
						</g:if>
						<g:else>
							<g:textField name="cafeteria.fsaRoutingNo" value="${enroll?.cafeteria?.fsaRoutingNo}"/>
						</g:else>							
					</td>
					<td class="num">
						<g:if test="${confirmPage}">
							${enroll?.cafeteria?.fsaActNo}
						</g:if>
						<g:else>
							<g:textField name="cafeteria.fsaActNo" value="${enroll?.cafeteria?.fsaActNo}"/>
						</g:else>							
					</td>
					<td class="mid">
						<g:if test="${confirmPage}">
							<g:if test="${enroll?.cafeteria?.fsaRepayActType == 'C'}">
								Checking
							</g:if>
							<g:elseif test="${enroll?.cafeteria?.fsaRepayActType == 'S'}">
								Savings
							</g:elseif>
							<g:elseif test="${enroll?.cafeteria?.fsaRepayActType == null}">
								&#160;
							</g:elseif>
						</g:if>
						<g:else>
							<b>Checking:</b> <g:radio name="cafeteria.fsaRepayActType" value="C" checked="${enroll?.cafeteria?.fsaRepayActType == 'C'}"/>
							<b>Savings:</b>  <g:radio name="cafeteria.fsaRepayActType" value="S" checked="${enroll?.cafeteria?.fsaRepayActType == 'S'}"/>
						</g:else>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</fieldset>

<g:if test="${enroll?.contact?.unionStatus}">
	<fieldset>
		<legend>Company Contribution</legend>
		<div style="margin: 5px 0 10px 5px;">
			<b>Employer Contribution:</b>&#160;&#160; ${cafeteria?.contribution?:'N/A'}
		</div>	
	</fieldset>	
</g:if>

<% if (!params.pdf) { %> 
<g:javascript>
	if ($('input[alias=fsaRepayMethod]:checked').val() == 'D') {
		$('#directDeposit').show();
	} 
	$('input[alias=fsaRepayMethod]:radio').change(function () {
		if ($('input[alias=fsaRepayMethod]:checked').val() == 'D') {
			$('#directDeposit').show();
		} else {
			$('#directDeposit').hide();
		}
	});
	$('#urmElec').change(function() {
		if (isNaN($(this).val()) ) {
			alert('Please enter a number');
		} else {
			$('#urmDed').val($(this).val() * 26);
		}
	});
	$('#urmDed').change(function() {
		if (isNaN($(this).val()) ) {
			alert('Please enter a number');
		} else {
			$('#urmElec').val(Math.round($(this).val() / 26));
		}	
	});
	$('#ddcElec').change(function() {
		if (isNaN($(this).val()) ) {
			alert('Please enter a number');
		} else {
			$('#ddcDed').val($(this).val() * 26);
		}
	});
	$('#ddcDed').change(function() {
		if (isNaN($(this).val()) ) {
			alert('Please enter a number');
		} else {
			$('#ddcElec').val(Math.round($(this).val() / 26));
		}	
	});

</g:javascript>
<% } %>