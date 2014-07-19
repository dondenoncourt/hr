<dl class="full">
	<dt> <label for="election"><g:message code="enroll.election.label" default="Election" /> </label> </dt>
	<dd class="value ${hasErrors(bean: enroll, field: 'election', 'errors')}">
		<g:if test="${confirmPage}">
			<g:if test="${enroll?.election == 'S'}">
				Single
			</g:if>
			<g:elseif test="${enroll?.election == '2'}">
				Two Person
			</g:elseif>
			<g:elseif test="${enroll?.election == 'F'}">
				Family
			</g:elseif>
			<g:elseif test="${enroll?.election == null}">
				&#160;
			</g:elseif>
		</g:if>
		<g:else>
			Single: 	<g:radio name="election" value="S" checked="${enroll?.election == 'S'}"/>
			Two Person: <g:radio name="election" value="2" checked="${enroll?.election == '2'}"/>
			Family: 	<g:radio name="election" value="F" checked="${enroll?.election == 'F'}"/>	
		</g:else>
	</dd>
	<dt> <label for="waive"><g:message code="enroll.waive.label" default="Waive" /> </label> </dt>
	<dd class="value ${hasErrors(bean: enroll, field: 'waive', 'errors')}">
		<g:if test="${confirmPage}">
			<g:if test="${enroll?.waive}">
				<img src="${resource(dir:'images',file:'checkmark.gif')}" alt="Coverage Waived" width="20" height="15" />
			</g:if>		
		</g:if>
		<g:else>
			<g:checkBox name="waive" value="${enroll?.waive}" />
		</g:else>
	</dd>
</dl>
