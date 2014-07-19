<%@ page import="daffron.fms.hr.recruiting.Requisition" %>
<%@ page import="daffron.fms.hr.recruiting.Candidate" %>
<%@ page import="daffron.fms.hr.recruiting.TestScore" %>
<%@ page import="daffron.fms.hr.recruiting.YesNoAns" %> 
<%@ page import="daffron.fms.hr.recruiting.Behavior" %> 
<%@ page import="daffron.fms.hr.recruiting.BehaviorResult" %> 

<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="recruiting" />
        <g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
	    <r:require module="common"/>
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <style>
            hr {margin-top:50px; margin-bottom: 15px; display:block; clear: left;}
        </style>
    </head>
    <body>
		<h1>Test Score Results Maintenance</h1>
       	<div id="messages" class="${flash.message?'message':''}">${flash.message}</div>
		<g:hasErrors bean="${score}">
		<div class="errors">
		    <g:renderErrors bean="${score}" as="list" />
		</div>
		</g:hasErrors>
		<div class="twoColLeft">
			<h2>${req}</h2>
			<g:select name="candidateId" from="${candidates}" optionKey="id" noSelection="${['null':'Select One...']}" tabindex="1" />
	        <br/>
			<table id="standardTestTable" class="candFilter">
				<thead><tr><th>Test</th><th>Percentage</th></tr></thead>
				<tbody>       	
					<g:render template="standardTestRows"/>
				</tbody>
			</table>
			<br />			
			<h2>Standard Tests</h2>
	        <g:select name="testId" from="${req.jobD.tests}" optionKey="id"  noSelection="${['null':'Select One...']}" tabindex="2"/>
			<br/>
			<dl id="scoreBox">
			   <dt>Questions:</dt>
			   <dd id="questions"></dd>
			   <dt>Correct:</dt>
			   <dd><g:textField name="correct" size="8" tabindex="3:"/></dd>
			   <dt>&#160;</dt>
			   <dd>
			       <input type="button" class="button add" id="addStandardTestScore" title="Add Test Score" tabindex="4" value="Add" name="Add" />
			   </dd>
	        </dl>
	        <br/>
	        <hr/>
		    <div id="behavioral">
	        <h2>Behavioral Tests</h2>
			<table id="behaviorTable" class="candFilter">
				<thead><tr><th>Behavior</th><th>Score</th><th>Note</th></tr></thead>
				<tbody>       	
					<g:render template="behaviorRows"/>
				</tbody>
			</table>
			<dl>
				<dt>Behavior</dt>
				<dd>
			        <g:select name="behavior" from="${Behavior.list()}" optionKey="id"  
				noSelection="${['null':'Select a behavior']}"
			    tabindex="5"	
			/>
			</dd>
			<dt class="behaviorShowHide">Notes</dt>
			<dd class="behaviorShowHide">
			       <g:textArea name="note" rows="2" cols="80"/>
			</dd>
			<dt class="behaviorShowHide">Score</dt>
			<dd class="behaviorShowHide">
			       <g:select name="result" from="${BehaviorResult.constraints.result.inList}" valueMessagePrefix="behavior.result" 
				noSelection="${['null':'Select a score...']}"
			    tabindex="6"	
			/>
				</dd>
			</dl>
		    </div> 
	    </div>
		<div class="buttons linkBtns">
            <a class="list button" href="#" title="Requisition List">Req List</a>
            <a class="save button next" href="#" title="Move to the next status" >Next</a>
	    </div>
	    <g:if test="${!params.pdf}">
	        <g:javascript>
		        $('a.list.button').click(function() { 
		          setTimeout(function () {window.location = "${createLink(controller:'requisition',action:'list')}"}, 2000); 
		        });
		        $('a.next.button').click(function() { 
		    		if (confirm('Are you sure? This will advance the requisition status from ${req.status.id} to ${nextStatus}')) {
			          setTimeout(function () {window.location = "${createLink(controller:'requisition',action:'next',id:req.id)}"}, 1000); 
			        }
		        });
		        $('input[name=correct]').change(function() {
    	        	$('#addStandardTestScore').trigger('click');
		        });
	        	$('#addStandardTestScore').click(function() {
	        		if ($('#candidateId').val() == 'null') {
	        			alert('Please select a candidate');
	        			$('#candidateId').focus();
	        			return;
	        		}
					if ($.trim($("#correct").val()).length == 0) {
						alert('please key a value for correct');
						$("#correct").focus();
						return;
					} else if (isNaN($("#correct").val())) {
						alert('please key a numeric value for correct');
						$("#correct").focus();
						return;
					} else if (Number($.trim($("#correct").val())) > Number($('#questions').html()) ) {
						alert('correct cannot be larger then the total number of questions');
						$("#correct").focus();
						return;
					}
			        $.ajax({
			            url: "${createLink(action:'addStandardTestScore')}", 
			            data: 'reqId='+${req.id}+'&candidateId='+$('#candidateId').val()+'&testId='+$('#testId').val()+'&correct='+$('#correct').val(),
			            type: "POST",
			            success: function(data) {rebuildStandardTestTable();},
			            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
			        });
	        		$('#testId').val('null');
	        		$('#correct').val('');
		        	$('#scoreBox').hide();
	        	}); 
	        	$('#candidateId').change(function(){
					rebuildBehaviorTable();
					rebuildStandardTestTable();
	        	});
	        	function rebuildBehaviorTable() {
			        $.ajax({
			            url: "${createLink(action:'rebuildBehaviorTable')}", 
			            data: 'candidateId='+$('#candidateId').val(),
			            type: "POST",
			            success: function(data) {$('#behaviorTable tbody').html(data);},
			            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
			        });
	        	}
	        	function rebuildStandardTestTable() {
			        $.ajax({
			            url: "${createLink(action:'rebuildStandardTestTable')}", 
			            data: 'candidateId='+$('#candidateId').val(),
			            type: "POST",
			            success: function(data) {$('#standardTestTable tbody').html(data);},
			            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
			        });
			        $('#testId').focus();
	        	}
	        	$('.behaviorShowHide').hide();
	        	$('#behavior').change(function(){
	        		if ($('#candidateId').val() == 'null') {
	        			alert('Please select a candidate');
	        			$('#candidateId').focus();
		        		$('#behavior').val('null');
	        			return
	        		}
		        	$('.behaviorShowHide').show();
		        	$('#result').focus();
		        	$('#result').change(function(){
				        $.ajax({
				            url: "${createLink(action:'addBehaviorResult')}", 
				            data: 'candidateId='+$('#candidateId').val()
				                  +'&reqId='+${req.id}
				                  +'&behaviorId='+$('#behavior').val()
				                  +'&note='+$('#note').val()
				                  +'&behaviorResult='+$('#result').val(),
				            type: "POST",
				            success: function(data) {rebuildBehaviorTable();},
				            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
				        });
		        		$('#behavior').val('null');
		        		$('#result').val('null');
		        		$('#note').val('');
			        	$('.behaviorShowHide').hide();
			        	$('#result').unbind('change');
		        	});
	        	});
	        	
	        	$('#scoreBox').hide();
	        	$('input.button').hide();
				$("#testId").change(function() {
			        $.ajax({
			            url: "${createLink(action:'getTestInfo')}", 
			            data: "testId="+$(this).val()+'&candidateId='+$('#candidateId').val(),
			            type: "POST",
			            success: function(data) {$('#questions').html(data.questions);},
			            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
			        });
		        	$('#scoreBox').show();
		        	$('input.button').show();
		        });
		    </g:javascript>
		</g:if>
    </body>
</html>
/
