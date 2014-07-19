<%@ page import="org.codehaus.groovy.grails.commons.ConfigurationHolder as CH" %>
<%@ page import="daffron.fms.hr.enrollment.VoluntaryInsurance" %>
<div id="volInsHeader">
	<div class="left">
		<a href="http://www.unum.com/"><img src="${resource(dir:'images',file:'unum_logo.jpg')}"/></a>
	</div>
	<div class="right">
		<p>
		You have the opportunity to enroll in a number of voluntary insurance products through UNUM. A
		representative will be available to meet with you to discuss the products and associated costs for the
		2012 Plan Year during the open enrollment period. Please contact Human Resources to schedule a
		meeting. Your current voluntary product elections and your choices for 2012 are listed below.
		</p>
	</div>
</div>
<table id="voluntaryInsuranceTableHead" class="enrollment">
	<thead>
		<tr>
			<th class="fourCol text">Elections</th>
			<th class="fourCol num">2011 Cost</th>
			<th class="fourCol num">2012 Cost</th>
			<th class="fourCol mid">Option</th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${CH.config.hr.enrollment.voluntary.insurance.products}" var="volLifeProd">
			<% def covered = CH.config.hr.enrollment.voluntary.insurance.covered."$volLifeProd.key" %>
			<g:each in="${covered}" var="coveredPersonType" status="iCovered">
				<% def volIns = enroll.voluntaryInsurance?.find{it.name == volLifeProd.key && it.coveredPersonType == coveredPersonType} 
					if (volLifeProd =~ 'Flat Rate' && !volIns.benefit && !volIns.benefitExtra) {
						return
					}
				%>
				<g:if test="${iCovered == 1}">
					<tr>
						<th class="fourCol text">${volLifeProd.value}</th>
						<th class="fourCol num">${(CH.config.hr.enrollment.voluntary.insurance.paymentPeriod)."$volLifeProd.key"}</th>
						<th class="fourCol num">${(CH.config.hr.enrollment.voluntary.insurance.paymentPeriod)."$volLifeProd.key"}</th>
						<th class="fourCol mid">Option</th>
					</tr>
				</g:if>
				<tr>
					<g:if test="${!confirmPage}">
						<g:hiddenField name="name" value="${volLifeProd.key}" />
						<g:hiddenField name="coveredPersonType" value="${coveredPersonType}" />
					</g:if>

					<td>${VoluntaryInsurance.COVERED_PERSON_TYPE_MAP."$coveredPersonType.value"} 
						<g:if test="${volIns?.benefit}">
							<g:if test="${volLifeProd =~ 'Flat Rate'}">
								Spouse
							</g:if>
							$<g:formatNumber number="${volIns?.benefit?:0}" format="###,###,###" />
						</g:if>
						<g:if test="${volIns?.benefitExtra}">
							<g:if test="${volLifeProd =~ 'Flat Rate'}">
								Child
							</g:if>
							$<g:formatNumber number="${volIns?.benefitExtra?:0}" format="###,###,###" />
						</g:if>
					</td>
					<td class="num"><g:formatNumber number="${volIns?.costPriorPerPay?:0}" format="###,###,##0.00" /></td>
					<td class="num"><g:formatNumber number="${volIns?.costPerPay?:0}" format="###,##0.00" /></td>
					<% def options = (CH.config.hr.enrollment.voluntary.insurance.options)."$volLifeProd.key".value %>
					<td style="padding-left: 28px;">
						<g:if test="${confirmPage}">
							<% out.print(VoluntaryInsurance.OPTION_TYPE_MAP."${volIns?.optionType}") %>
						</g:if>
						<g:else>
							<g:each in="${options}"	var="optionType" status="i">
								<% def optionValue =  VoluntaryInsurance.OPTION_TYPE_MAP."${optionType}" %>
								${optionValue}
								<input type="radio" 
									name="optionType-${volLifeProd.key}-${coveredPersonType}" 
									id="optionType_${volLifeProd.key}_${coveredPersonType}_${optionType}" 
									value="${optionType}"  
									${(volIns?.optionType.toString() == optionType.toString())?'checked="checked"':''}
									/>
								<g:if test="${volLifeProd =~ 'Flat Rate' && optionValue == 'Cancel'}">
									<g:javascript>
										$('#optionType_${volLifeProd.key}_${coveredPersonType}_${optionType}').click(function() {
											alert('Note: You cannot re-apply for ${volLifeProd.value} at a later date');
										});
									</g:javascript>
								</g:if>
							</g:each>
						</g:else>
					</td>
				</tr>
			</g:each>
		</g:each>
	</tbody>
</table>
