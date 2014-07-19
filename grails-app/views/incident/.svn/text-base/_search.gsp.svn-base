<div class="iXpStd">
	<g:form action="list">
		<dl>
			<dt>Employee Name </dt>
			<dd class="value ${hasErrors(bean: incident, field: 'employee', 'errors')}">
    			<g:textField name="employeeNamePrefix" value="${incident?.employee?.name?:params.employeeNamePrefix}" />&#160;
    			<g:actionSubmit class="search button" action="list" value="Search" />
			</dd>
		</dl>        
	</g:form>
</div>

<g:javascript>
	$("#employeeNamePrefix").autocomplete({
	    source: getEmpNames, // in /javascript/safety.gsp
	    change: function(event, ui) { 
	        $.ajax({
	            url: "${createLink(controller:'employee', action:'empNoByName')}", 
	            data: "name="+$('#employeeNamePrefix').val(),
	            type: "POST",
	            success: function(data) { if (window.console) console.log(data); },
	            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
	        });
	    }, 
	    minLength: 1
	});
</g:javascript>