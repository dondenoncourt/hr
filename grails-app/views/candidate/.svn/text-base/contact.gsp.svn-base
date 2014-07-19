<%@ page import="daffron.fms.hr.recruiting.Candidate" %>
<%@ page import="daffron.fms.hr.recruiting.RequisitionStatus" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="recruiting" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'recruitment.css')}" />
	    <r:require module="common"/>
        <g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
	            <h1>Selected Candidates: ${RequisitionStatus.get(req.status.id)?.desc}</h1>
	            <div id="messages" class="${flash.message?'general':''} msg">${flash.message}</div>
            <g:if test="${req.status.id == 'PRECONTACT'}">
	            <h2>Tests:</h2>
	            <table class="candFilter">
	            	<thead>
	            	  <tr>
	            	      <th>Test</th>
	            	      <th>URL</th>
	            	  </tr>      
           	        </thead>
	            	<tbody>
			            <g:each in="${req.jobD.tests}" var="test">
			            	<tr>
			                	<td>${test?.name.encodeAsHTML()}</td><td>${test?.url.encodeAsHTML()}</td>
			                </tr>
			            </g:each>
		            </tbody>
	            </table>
	            <br/>
            </g:if>
            <g:else>
                <h2>Interview Team:</h2>
                <ul>
					<li>${req.supervisor}:Requesting supervisor</li>
					<g:each in="${req.interviewTeam}" var="interviewer">
						<li>${interviewer.emp.name}:${interviewer.emp.jobClassDescription }</li>
					</g:each>
                </ul>
                <br/>
            </g:else>
            <div class="list">
                <table class="recruitment">
                    <thead>
                        <tr>
                            <th style="width: 4%">Rank</th>
                            <th style="width: 14%">Name</th>
                            <th style="width: 8%">Phone</th>
                            <th style="width: 16%">Email</th>
                            <th style="width: 17%">Notes</th>
					        <g:if test="${req.status.id == 'PRECONTACT'}">
                        		<th style="width: 41%">Test Date</th>
                        	</g:if>
                        	<g:else><!--  must be SINTD -->
                        		<th style="width: 41%">Interview Date/Time</th>
                        	</g:else>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${candidateList}" status="i" var="reqCandi">
                        <g:set var="candidate" value="${reqCandi.candidate}"/>
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${reqCandi.rank}</td>
                            <td>${fieldValue(bean: candidate, field: "name")}</td>
                            <td><daffron:formatPhone phone="${candidate.phoneNo}" /></td>
                            <td>${fieldValue(bean: candidate, field: "email")}</td>
                            <td><input type="text" name="note" id="note" reqCandiId="${reqCandi.id}" /></td>
                            <td id="dates${reqCandi.id}">
					            <g:if test="${req.status.id == 'PRECONTACT'}">
                                    <g:render template="precontactDates" model="[reqCandi:reqCandi]"/>
                            	</g:if>
                            	<g:else><!--  must be SINTD -->
                           			<g:form action="interviewDate">
                           				<g:hiddenField name="id" value="${reqCandi.id}"/>
                           				<g:if test="${reqCandi.interview}">
                           				    <span style="background-color: #99FFCC; font-weight: bold; font-size: 12px;">										    
										        Interview Scheduled for ${reqCandi.interview}<br /><br />
                                            </span>
									    </g:if>
                           				<g:datePicker name="interview" value="${reqCandi.interview}"/>
                           				<input class="cal button" type="button" name="interviewDateButton" 
                           				   value="${reqCandi.interview?'re-':''}Schedule" 
                           				/>
                           			</g:form>
                            	</g:else>
                            </td>
                        </tr>
	                    <g:each in="${candidate.notes.sort{id}}" var="note">
	                    	<tr>
		                    	<td colspan="4"/>
		                    	<td colspan="2">${note}</td>
		                    </tr>
	                    </g:each>
                        
                    </g:each>
                    </tbody>
                </table>
			    <div class="buttons linkBtns">
    	            <a class="list button" href="#" title="Requisition List">Back</a>
        	        <a class="save button next" href="#" title="Move from ${req.status.id} to the next status" >Next</a>
	        	</div>
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
	           function setActionHandlers() {
	        	$('input[type=button][name=onsiteTestButton]').click(function() {
	        		var id = this.form.id.value;
		        	$.ajax({
		        		url:'${createLink(action:'onsiteTestDate')}',
		        		type:'POST',
		        		data: $(this.form).serialize(), 
		        		success:function(data) {
		        		    $('#dates'+id).html(data);
		        		    $('#messages').addClass('general');
		        		    $('#messages').html('Requisition updated with on-site test date');
            		       setActionHandlers();
		        		},
		        		error:function(XMLHttpRequest,textStatus,errorThrown){}
		        	});
	        	});
	        	$('input[type=button][name=interviewDateButton]').click(function() {
	        		var id = this.form.id.value;
		        	$.ajax({
		        		url:'${createLink(action:'interviewDate')}',
		        		type:'POST',
		        		data: $(this.form).serialize(), 
		        		success:function(data) {
		        		    $('#messages').addClass('general');
		        		    $('#messages').html('Requisition updated, interview time set to '+data);
		        		},
		        		error:function(XMLHttpRequest,textStatus,errorThrown){}
		        	});
	        	});
	        	
	        	$('input[value=onsite]').click(function() {
        			var id = $(this).attr('reqCandiId');
        			$('#onlineOrOnsite'+id).hide();
        			$('#onsiteTest'+id).show();
	        	});
	        	$('#note').change(function() {
	        		var note = $(this).val();
	        		if (note.length > 0) {
				        $.ajax({
				            url: "${createLink(action:'addNote')}", 
				            data: "id="+$(this).attr('reqCandiId')+'&note='+note,
				            type: "POST",
				            success: function(data) {
				            	$(this.parentElement).html('updated');
    		        		    $('#messages').addClass('general');
    		        		    $('#messages').html('A note has been added to the requisition');
				            },
				            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
				        });
	        		}
	        		if (this.debug) console.log($(this).attr('reqCandiId')+' value:'+note);
	        	});
	        	$('input[value=online]').click(function() {
        			var id = $(this).attr('reqCandiId');
			        $.ajax({
			            url: "${createLink(action:'onlineTest')}", 
			            data: "id="+id,
			            type: "POST",
		        		success:function(data) {
		        		    $('#dates'+id).html(data);
		        		    $('#messages').addClass('general');
		        		    $('#messages').html('Requisition updated with on-line test');
            		       setActionHandlers();
		        	    },
			            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
			        });
		        });
		       }
		       setActionHandlers();
	        </g:javascript>
		</g:if>        
    </body>
</html>
