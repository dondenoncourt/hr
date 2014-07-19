<%@ page import="daffron.fms.hr.recruiting.Requisition" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="recruiting" />
        <r:require module="common"/> 
        <title>Select Interview Team</title>
		<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script> 
    </head>
    <body>	            
		<h1>Select Interview Team</h1>
		<div id="messages" class="${flash.message?'message':''}">${flash.message}</div>
		<g:hasErrors bean="${req}">
		<div class="errors">
		    <g:renderErrors bean="${req}" as="list" />
		</div>
		</g:hasErrors>
		<table id="interviewTeam" class="recruitment">
			<thead><th>Name</th><th>Job Class</th></thead>
			<tbody>
				<tr><td>${req.supervisor}</td><td>Requesting supervisor</td></tr>
				<g:each in="${req.interviewTeam}" var="interviewer">
					<tr><td>${interviewer.emp.name}</td><td>${interviewer.emp.jobClassDescription }</td></tr>
				</g:each>
			</tbody>
		</table>
		<g:hiddenField name="id" value="${req.id}"/>
		<g:textField name="interviewer" size="30" />
		<input type="button" class="add button" name="add" id="add" value="Add"/>
		         <br/>
		         <div class="note">
		         	Please add 3 interviewers: one from Human Resources, one from outside the department, and a peer.
		         </div>
		         <br/>
        <div class="buttons linkBtns">
     		 <g:link class="list button" action="list" controller="requisition" title="Requisition List">Req List</g:link>
		</div>
        <% if (!params.pdf) { %>
			<g:javascript>
			    $("#interviewer").autocomplete({
			        source: getEmpNames,
			        minLength: 1
			    });
			    function getEmpNames(request, response) {
		            $.ajax({
		                url: "${createLink(action:'empNames')}", 
		                data: "name="+request.term,
		                type: "POST",
		                dataFilter: function(data) { return data; },
		                success: function(data) {response($.map(data, function(item) {if (this.debug) console.log(item.jobClass);return {value: item.name}}))},
		                error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
		            });
			    }
			    $("#add").click(function() {
					if ($.trim($('#interviewer').val()) == '') { return; }
					$.ajax({
						url: "${createLink(action:'empNoByName')}",
						data: 'name='+$('#interviewer').val(),
						type: "POST",
						success: function(empNo) {
							if (empNo.length == 0) {
								alert($('#interviewer').val()+' not found in the employee database');
								return
							}
							addInterviewer(empNo);
							$('#interviewer').val('');
						},
						error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
					});
				});
				function addInterviewer(empNo) {
		            $.ajax({
		                url: "${createLink(action:'addInterviewer')}", 
		                data: 'id='+$('#id').val()+'&empNo='+empNo,
		                type: "POST",
		                success: function(data) {
							if (data == 'duplicate') {
								$('#messages').html('Attempt to add a duplicate ignored');
							} else {
								$('#interviewTeam tbody').append('<tr><td>'+data+'</td></tr>');
								$('#messages').html(data+' added');
							}
							$('#messages').addClass('message');
						},
		                error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
		            });
				}

			</g:javascript>
		<% } %>
    </body>
</html>
