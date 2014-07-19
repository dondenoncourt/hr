<fieldset>
	<legend>Contact Information Changes</legend>
		<dl> 
			<dt>Check if NO changes:</dt> 
			<dd>
				<g:if test="${confirmPage}">
					<g:if test="${enroll?.contact?.noChanges}">
						<img src="${resource(dir:'images',file:'checkmark.gif')}" alt="Coverage Waived" width="20" height="15" />
					</g:if>
					<g:else>
						&#160;
					</g:else>
				</g:if>
				<g:else>
					<g:checkBox name="contact.noChanges" id="noContactInfoChanges" checked="${enroll?.contact?.noChanges}"/>
				</g:else>
			</dd>
		</dl>
		<br />
	<div id="contactInfo">
		<dl>
			<dt>
				<label for="name"><g:message code="contact.name.label" default="First MI Last Name:" /></label>
			</dt>
			<dd	class="value ${hasErrors(bean: enroll, field: 'contact.firstName', 'errors')}">
				<g:if test="${confirmPage}">
					${enroll?.contact?.firstName ?: ''}
					${enroll?.contact?.mi ?: ''}
					${enroll?.contact?.lastName ?: ''}
				</g:if>
				<g:else>
					<g:textField name="contact.firstName" 
						value="${enroll?.contact?.firstName ?: ''}" />
					<g:textField name="contact.mi" 
						value="${enroll?.contact?.mi ?: ''}" size="1" />
					<g:textField name="contact.lastName" 
						value="${enroll?.contact?.lastName ?: ''}"  />
				</g:else>							
			</dd>
			<dt>
				<label for="address"><g:message	code="contact.address.label" default="Address:" /> </label>
			</dt>
			<dd	class="value ${hasErrors(bean: enroll, field: 'contact.addr.line1', 'errors')}">
				<g:if test="${confirmPage}">
					${enroll?.contact?.addr?.line1 ?: enroll?.employee?.address}
				</g:if>
				<g:else>
					<g:textField name="contact.addr.line1" value="${enroll?.contact?.addr?.line1 ?: enroll?.employee?.address}" />
				</g:else>
			</dd>
			<dt>City, State Zip:</dt>
			<dd class="value ">
				<g:if test="${confirmPage}">
					${enroll?.contact?.addr?.city ?: enroll?.employee?.city}, 
					${enroll?.contact?.addr?.state ?: enroll?.employee?.state} 
					${enroll?.contact?.addr?.zip ?: enroll?.employee?.zipCode}
				</g:if>
				<g:else>
					<span class="${hasErrors(bean: enroll, field: 'contact.addr.city', 'errors')}">
						<g:textField name="contact.addr.city"
							value="${enroll?.contact?.addr?.city ?: enroll?.employee?.city}" /> </span> <span
						class="${hasErrors(bean: enroll, field: 'contact.addr.state', 'errors')}">
						<daffron:stateDropDown name="contact.addr.state"
							value="${enroll?.contact?.addr?.state ?: enroll?.employee?.state}" /> </span> <span
						class="${hasErrors(bean: enroll, field: 'contact.addr.zip', 'errors')}">
						<g:textField name="contact.addr.zip" 
							value="${enroll?.contact?.addr?.zip ?: enroll?.employee?.zipCode}" />
					</span>
				</g:else>
			</dd>
			<dt>
				<label for="phone"><g:message code="contact.phone.label" default="Phone No:" /> </label>
			</dt>
			<dd class="value ${hasErrors(bean: enroll, field: 'contact.phone', 'errors')}">
				<g:if test="${confirmPage}">
					${enroll?.contact?.phone ?: enroll?.employee?.phoneNo}
				</g:if>
				<g:else>
					<g:textField name="contact.phone" value="${enroll?.contact?.phone ?: enroll?.employee?.phoneNo}" />
				</g:else>
			</dd>
			<dt><label for="status">Status:</label></dt>
			<dd class="value ${hasErrors(bean: enroll, field: 'contact.status', 'errors')}">
				<g:if test="${confirmPage}">
					${enroll?.contact?.status ?: '&#160;'}
				</g:if>
				<g:else>
					<g:textField name="contact.status" value="${enroll?.contact?.status ?: ''}" />
				</g:else>
			</dd>
			<dt><label for="unionStatus">Union Status:</label></dt>
			<dd class="value ${hasErrors(bean: enroll, field: 'contact.unionStatus', 'errors')}">
				<g:if test="${confirmPage}">
					${enroll?.contact?.unionStatus ?: '&#160;'}
				</g:if>
				<g:else>
					<g:textField name="contact.unionStatus" value="${enroll?.contact?.unionStatus ?: ''}" />
				</g:else>
			</dd>
			<dt><label for="workSite">Work Site:</label></dt>
			<dd class="value ${hasErrors(bean: enroll, field: 'contact.workSite', 'errors')}">
				<g:if test="${confirmPage}">
					${enroll?.contact?.workSite ?: '&#160;'}
				</g:if>
				<g:else>
					<g:textField name="contact.workSite" value="${enroll?.contact?.workSite ?: ''}" />
				</g:else>
			</dd>
			<dt><label for="maritalStatus">Marital Status:</label></dt>
			<dd class="value ${hasErrors(bean: enroll, field: 'contact.maritalStatus', 'errors')}">
				<g:if test="${confirmPage}">
					${enroll?.contact?.maritalStatus ?: '&#160;'}
				</g:if>
				<g:else>
					<g:textField name="contact.maritalStatus" value="${enroll?.contact?.maritalStatus ?: ''}" />
				</g:else>
			</dd>
			<dt><label for="gender">Gender:</label></dt>
			<dd class="value">
				 ${enroll?.contact?.gender ?: '&#160;'}
			</dd>
			<dt><label for="ssn">SSN:</label></dt>
			<dd id="ssnDD" class="value ${hasErrors(bean: enroll, field: 'contact.ssn', 'errors')}">
				<g:if test="${confirmPage}">
					<g:if test="${(enroll?.contact?.ssn?.size() >= 9)}">
						***-**-${ enroll.contact.ssn[5..8]}
					</g:if>
					<g:else>&#160;</g:else>
				</g:if>
				<g:else>
					<g:if test="${(enroll?.contact?.ssn?.size() >= 9)}">
						***-**-${ enroll.contact.ssn[5..8]}
						<a id="changeSSN">Change</a>
						<g:javascript>
							$('#changeSSN').click(function() {
								$('#ssnDD').html('<input type="text" name="contact.ssn" id="contact.ssn" size="10" value="${ enroll.contact.ssn}"/>');
							});
						</g:javascript>
					</g:if>
					<g:else>
						<input type="text" name="contact.ssn" id="contact.ssn" size="10"/>
					</g:else>
			 	</g:else>
			</dd>
		</dl>					
	</div>				
</fieldset>

<fieldset>
	<legend>Emergency Contact Information</legend>
	<g:each var="i" in="${ (1..2) }">
		<div id="EmerContact${i}Info">
			<dl>
				<dt class="right">
					<label for="emergency${i}Name"><g:message code="contact.emergency${i}Name.label" default="Name:" /> </label>
				</dt>
				<dd class="value">
					<g:if test="${confirmPage}">
						<% out.print (enroll?.contact?."emergency${i}Name" ?: '&#160;') %>
					</g:if>
					<g:else>
						<g:textField name="contact.emergency${i}Name" value='${(enroll?.contact?."emergency${i}Name")}' />
					</g:else>
				</dd>
				<dt class="right">
					<label for="emergency${i}Phone1">Day Phone:</label>
				</dt>
				<dd class="value">
					<g:if test="${confirmPage}">
						<% out.print (enroll?.contact?."emergency${i}Phone1" ?: '&#160;') %>
					</g:if>
					<g:else>
						<g:textField name="contact.emergency${i}Phone1" value='${(enroll?.contact?."emergency${i}Phone1")}' />
					</g:else>
				</dd>
				<dt class="right">
					<label for="emergency${i}Phone2">Night Phone:</label>
				</dt>
				<dd	class="value">
					<g:if test="${confirmPage}">
						<% out.print (enroll?.contact?."emergency${i}Phone2" ?: '&#160;') %>
					</g:if>
					<g:else>
						<g:textField name="contact.emergency${i}Phone2" value='${(enroll?.contact?."emergency${i}Phone2")}' />
					</g:else>
				</dd>
			</dl>
		</div>
	</g:each>
</fieldset>				            