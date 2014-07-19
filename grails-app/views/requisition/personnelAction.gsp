<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="recruiting" />
        <r:require module="common"/> 
        <g:set var="entityName" value="${message(code: 'requisition.label', default: 'Requisition')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
	    <h1>Personnel Action Form</h1>
	    <g:if test="${flash.message}">
	       <div class="message">${flash.message}</div>
	    </g:if>
        <g:hasErrors bean="${pa}">
        <div class="errors">
            <g:renderErrors bean="${pa}" as="list" />
        </div>
        </g:hasErrors>
	    <g:form>
		<fieldset >
			<legend>Add to Payroll</legend>
		    <dl class="twocol">
				<dt class="name">Candidate</dt><dd class="value ${hasErrors(bean: pa, field: 'candidate', 'errors')}">
				    ${pa.candidate?.name}
				</dd>
				<dt class="name">Effective Date</dt><dd class="value ${hasErrors(bean: pa, field: 'addEffective', 'errors')}">
					<daffron:jqDatePicker name="addEffective" value="${pa?.addEffective?g.formatDate(format:'MM/dd/yyyy', date:pa?.addEffective):''}" />
				</dd>
		    </dl>
		    <g:render template="paf" model="['pafType':'add', 'pafValue':pa.add]" />
		</fieldset> 
		<fieldset>
			<legend>Payroll Status and Change</legend>
		    <dl class="twocol">
            	<dt class="name">Employee</dt><dd class="value">
                   <g:select name="emp.id" 
                     from="${empList}"
                       optionKey="id" 
                       value="${pa?.emp?.id}" 
                       noSelection="${[null:'Select One...']}"/>
            	</dd>
				<dt class="name">Effective Date</dt><dd class="value ${hasErrors(bean: pa, field: 'changeEffective', 'errors')}">
					<daffron:jqDatePicker name="changeEffective" value="${pa?.changeEffective?g.formatDate(format:'MM/dd/yyyy', date:pa?.changeEffective):''}" />
				</dd>
				<dt class="name">Transfer</dt>
				<dd class="value"> <g:checkBox name="changeTransfer"  value="${pa.changeTransfer}"/> </dd>
		        <dt class="name">&nbsp;</dt><dd class="value">&nbsp;</dd>
				<dt class="name">Promotion</dt>
				<dd class="value"> <g:checkBox name="changePromotion"  value="${pa.changePromotion}"/> </dd>
				<dt class="name">Reason Other</dt>
				<dd class="value"><g:textField name="changeOther" value="${pa.changeOther}" /> </dd>
		    </dl>
		    <h1>From:</h1>
	        <g:render template="paf" model="['pafType':'from', 'pafValue':pa.from]" />
		    <h1>To:</h1>
		    <g:render template="paf" model="['pafType':'to', 'pafValue':pa.to]" />
		</fieldset> 
		Comment: <textarea name="comments" rows="4" cols="69" value="${pa.comments}"></textarea><br/>
		<fieldset>
			<legend>Signatures</legend>
		    <dl class="twocol">
				<dt class="name">Supervisor</dt>
				<dd class="value"> <g:select name="supervisor.id" id="supervisorId" from="${userList}" optionKey="employeeNo" value="${pa.supervisor?.id}" noSelection="[null:'Select one...']" /> </dd>
				<dt class="name">Sign Date</dt>
				<dd class="value ${hasErrors(bean: pa, field: 'supervisorApprove', 'errors')}">
					<daffron:jqDatePicker name="supervisorApprove" value="${pa?.supervisorApprove?g.formatDate(format:'MM/dd/yyyy', date:pa?.supervisorApprove):''}" />
				</dd>
		    </dl>
		    <dl class="twocol">
				<dt class="name">Department Manager</dt>
				<dd class="value"> <g:select name="deptManager.id" id="deptManagerId" from="${userList}" optionKey="employeeNo" value="${pa.deptManager?.id}"   noSelection="[null:'Select one...']" /> </dd>
				<dt class="name">Sign Date</dt>
				<dd class="value ${hasErrors(bean: pa, field: 'deptManagerApprove', 'errors')}">
					<daffron:jqDatePicker name="deptManagerApprove" value="${pa?.deptManagerApprove?g.formatDate(format:'MM/dd/yyyy', date:pa?.deptManagerApprove):''}" />
				</dd>
		    </dl>
		    <dl class="twocol">
				<dt class="name">HR</dt>
				<dd class="value"> <g:select name="hr.id" id="hrId" from="${userList}" optionKey="employeeNo" value="${pa.hr?.id}"   noSelection="[null:'Select one...']" /> </dd>
				<dt class="name">Sign Date</dt>
				<dd class="value ${hasErrors(bean: pa, field: 'hrApprove', 'errors')}">
					<daffron:jqDatePicker name="hrApprove" value="${pa?.hrApprove?g.formatDate(format:'MM/dd/yyyy', date:pa?.hrApprove):''}" />
				</dd>
		    </dl>
			<g:if test="${req.supervisor == session?.user?.employee}">
				I, ${session.user?.employee?.name}, approve this/these application(s) for employment 
				<input type="checkbox" name="approve"/>
			</g:if>
		</fieldset>
         <g:hiddenField name="id" value="${req?.id}" />
	     <div class="buttons">
            <g:hiddenField name="pafId" value="${pa?.id}" />
            <g:actionSubmit class="list button" action="list" value="Req List" />
            <g:actionSubmit class="save button" action="personnelActionUpdate" value="Update" />
			<g:if test="${req.supervisor == session?.user?.employee}">
	            <g:actionSubmit class="approve button" action="approveHiring" value="Approve" />
    		</g:if>
			<input type="button" name="email" value="email" class="button"/>
	     </div>
	    </g:form>
	    <g:javascript>
	        	$('input[type=button][name=email]').click(function() {
	        		var id = this.form.id.value;
	        		var params = 'id='+id
	        		if ($('#supervisorId').val() != 'null') {
    	        		params += '&supervisorId='+$('#supervisorId').val();
	        		}
	        		if ($('#deptManagerId').val() != 'null') {
    	        		params += '&deptManagerId='+$('#deptManagerId').val();
    	        	}
	        		if ($('#hrId').val() != 'null') {
	        		    params += '&hrId='+$('#hrId').val();
	        		} 
	        		
		        	$.ajax({
		        		url:'${createLink(controller:'requisition', action:'personnelActionEmail')}',
		        		type:'POST',
		        		data: params,
		        		success:function(data) { alert(data); },
		        		error:function(XMLHttpRequest,textStatus,errorThrown){}
		        	});
	        	});
	    </g:javascript>
    </body>
</html>
