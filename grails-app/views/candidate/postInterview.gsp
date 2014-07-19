<%@ page import="daffron.fms.hr.recruiting.Candidate" %>
<%@ page import="daffron.fms.hr.recruiting.RequisitionStatus" %>
<%@ page import="daffron.fms.hr.recruiting.Note" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="recruiting" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'recruitment.css')}" />
	    <r:require module="common"/>
        <title>Post Interview</title>
    </head>
    <body>
	    <h1>Post Interview For Requisition ${req.id}: ${req}</h1> 
       	<div id="messages" class="${flash.message?'message':''}">${flash.message}</div>
	    <div class="list">
	        <table class="recruitment">
	            <thead>
	                <tr>
	                 <th>Rank</th>
	                 <th>Name</th>
	                 <th>Background</th>
	                 <th>Phone</th>
	                 <th>Note</th>
		             <th>Drug Test</th>
    		         <g:if test="${RequisitionStatus.activeStatuses().find{it.id == 'OFFER'}}">
			             <th>Offer</th>
			         </g:if>
	                 <th>Start Date</th>
	                 <th>Reject</th>
	                </tr>
	            </thead>
	            <tbody>
	            <g:each in="${candidateList}" status="i" var="reqCandi">
	                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                    <td>${reqCandi.rank}</td>
	                    <td><g:link action="show" id="${reqCandi.candidate.id}">${reqCandi.candidate.name}</g:link></td>
	                    <td>
	                    	<g:if test="${!reqCandi.backgroundCheckInitiated}">
	                    		<g:checkBox name="backgroundCheckInitiated" reqCandiId="${reqCandi.id}" /> Initiated
	                    	</g:if>
	                    	<g:elseif test="${!reqCandi.backgroundCheckComplete}">
	                    		<g:radio name="backgroundCheck${reqCandi.id}" class="backgroundCheck" value="true" reqCandiId="${reqCandi.id}"/> Passed
	                    		<g:radio name="backgroundCheck${reqCandi.id}"  class="backgroundCheck" value="false" reqCandiId="${reqCandi.id}"/> Failed
	                    	</g:elseif>
	                    	<g:else>
	                    		<g:radio name="backgroundCheck${reqCandi.id}" class="backgroundCheck" checked="${reqCandi.backgroundCheck?true:false}" value="true" reqCandiId="${reqCandi.id}"/> Passed
	                    		<g:radio name="backgroundCheck${reqCandi.id}" class="backgroundCheck" checked="${reqCandi.backgroundCheck?false:true}" value="false" reqCandiId="${reqCandi.id}"/> Failed
	                    	</g:else>
	                    </td>
	                    <td>${reqCandi.candidate.phoneNo}</td>
	                    <td>
	                    	<g:if test="${(reqCandi.candidate.notes.find{it.reqStatus == reqCandi.requisition.status})}">
	                    		        <% def note = reqCandi.candidate.notes.find{it.reqStatus == reqCandi.requisition.status} %>
	                    		        ${note}
	                    	</g:if>
	                    	<g:else>
	                    		<input type="text" name="note" id="note" reqCandiId="${reqCandi.id}" class="note"/>
	                    	</g:else> 
	                    </td>
	                    <td>
	                    	<g:if test="${reqCandi.backgroundCheckComplete && reqCandi.backgroundCheck}">
		                     	<g:if test="${!reqCandi.drugTestInitiated}">
		                     		<g:checkBox name="drugTestInitiated" reqCandiId="${reqCandi.id}" /> Initiated
		                     	</g:if>
		                     	<g:elseif test="${!reqCandi.drugTestComplete}">
		                     		<g:radio name="drugTest${reqCandi.id}" class="drugTest" value="true" reqCandiId="${reqCandi.id}"/> Passed
		                    		<g:radio name="drugTest${reqCandi.id}" class="drugTest" value="false" reqCandiId="${reqCandi.id}"/> Failed
		                     	</g:elseif>
		                     	<g:else>
		                     		<g:radio name="drugTest${reqCandi.id}" class="drugTest" checked="${reqCandi.drugTest?true:false}" value="true" reqCandiId="${reqCandi.id}"/> Passed
		                    		<g:radio name="drugTest${reqCandi.id}" class="drugTest" checked="${reqCandi.drugTest?false:true}" value="false" reqCandiId="${reqCandi.id}"/> Failed
		                     	</g:else>
	                    	</g:if>
	                    </td>
    		        	<g:if test="${RequisitionStatus.activeStatuses().find{it.id == 'OFFER'}}">
		                    <td>
		                    	<g:if test="${reqCandi.drugTestComplete}">
		                   			<g:form controller="requisition" action="sendOfferLetter" enctype="multipart/form-data">
		                   				<g:hiddenField name="id" value="${reqCandi.id}"/>
				               			<input type="file" name="offerLetter"/>       
		                   				<input type="submit" name="offerLetterButton" value="${reqCandi.offerLetter?'re-':''}Send" class="button update"/>
		                   			</g:form>
			                     	<g:if test="${reqCandi.offerLetter}">
			                     		<g:radio name="offerAccepted${reqCandi.id}" class="offerAccepted" value="true" 
			                     		   checked="${reqCandi.offerAccepted?true:false}" reqCandiId="${reqCandi.id}"/> 
			                     		   Accepted
			                     		<g:radio name="offerAccepted${reqCandi.id}"  class="offerAccepted" value="false" 
			                     		   checked="${(reqCandi.offerResponse && !reqCandi.offerAccepted)?true:false}" reqCandiId="${reqCandi.id}"/> 
			                     		   Declined
		                     		</g:if>
				                </g:if>
		                    </td>
	                    </g:if>
	                    <td>
	                    	<g:if test="${reqCandi.start}">
		                     	<g:formatDate date="${reqCandi.start}"  format="MM-dd-yyyy"/>
	                    	</g:if>
	                    	<g:else>
	                    		<span id="startDate${reqCandi.id}" class="startDate ${(reqCandi.drugTest?'':'hide')}">
	                    			<g:form action="startDate">
	                    				<g:hiddenField name="id" value="${reqCandi.id}"/>
			                      		<g:datePicker name="start" value="${reqCandi.start}" precision="day"/>
	                    				<input type="button" name="startDateButton" value="Set" class="button update"/>
	                    			</g:form>
	                    		</span>
	                    	</g:else>
	                    </td>
						<td><g:radio name="reject" class="reject" value="false" reqCandiId="${reqCandi.id}" /></td>
	                </tr>
	            </g:each>
	             </tbody>
	         </table>
		    <div class="buttons linkBtns">
	            <a class="list button" href="#" title="Requisition List">Req List</a>
	            <a class="save button next" href="#" title="Move to the next status" >Next</a>
		 	</div>
	    </div>
	    <g:if test="${!params.pdf}">
	        <g:javascript>
		        $('a.list.button').click(function() { 
		          setTimeout(function () {window.location = "${createLink(controller:'requisition',action:'list')}"}, 1000); 
		        });
		        $('a.next.button').click(function() { 
		    		if (confirm('Are you sure? This will advance the requisition status from ${req.status.id} to ${nextStatus}')) {
    		          setTimeout(function () {window.location = "${createLink(controller:'requisition',action:'next',id:req.id)}"}, 1000); 
    		        }
		        });
		        
		        /*
	        	$('input[type=button][name=offerLetterButton]').click(function() {
	        		var id = this.form.id.value;
	        		$(this.form).hide();
		        	$.ajax({
		        		url:'${createLink(controller:'requisition', action:'sendOfferLetter')}',
		        		type:'POST',
		        		data: $(this.form).serialize(), 
		        		success:function(data) {
			                $('#messages').html(data); 
					        $('#messages').addClass('message');
		        		},
		        		error:function(XMLHttpRequest,textStatus,errorThrown){}
		        	});
	        	});
	        	*/
	        	$('input.offerAccepted').change(function() {
			        $.ajax({
			            url: "${createLink(controller:'requisition', action:'offerResponse')}", 
			            data: "id="+$(this).attr('reqCandiId')+'&offerAccepted='+$(this).val(),
			            type: "POST",
			            success: function(data) {
			                 $('#messages').html(data); 
					         $('#messages').addClass('message');
			            },
			            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
			        });
			    });
	        	$('input[type=button][name=startDateButton]').click(function() {
	        		var id = this.form.id.value;
		        	$.ajax({
		        		url:'${createLink(action:'startDate')}',
		        		type:'POST',
		        		data: $(this.form).serialize(), 
		        		success:function(data) {
			                $('#messages').html('Start date set to '+data); 
					        $('#messages').addClass('message');
		        		},
		        		error:function(XMLHttpRequest,textStatus,errorThrown){}
		        	});
	        	});
	        
	        	$('#note').change(function() {
	        		var note = $(this).val();
	        		if (note.length > 0) {
				        $.ajax({
				            url: "${createLink(action:'addNote')}", 
				            data: "id="+$(this).attr('reqCandiId')+'&note='+note,
				            type: "POST",
				            success: function(data) { 
				                $('#messages').html('Note updated'); 
    					        $('#messages').addClass('message');
				            },
				            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
				        });
	        		}
	        		if (this.debug) console.log($(this).attr('candidateId')+' value:'+note);
	        	});
	        	$('input[name=backgroundCheckInitiated]').change(function() {
			        $.ajax({
			            url: "${createLink(action:'backgroundCheckInit')}", 
			            data: "id="+$(this).attr('reqCandiId'),
			            type: "POST",
			            success: function(data) {
			                 $('#messages').html('background check initiated'); 
 					         $('#messages').addClass('message');
			            },
			            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
			        });
	        	});
	        	$('input.backgroundCheck').change(function() {
			        $.ajax({
			            url: "${createLink(action:'backgroundCheck')}", 
			            data: "id="+$(this).attr('reqCandiId')+'&result='+$(this).val(),
			            type: "POST",
			            success: function(data) {
			                 $('#messages').html('background check updated'); 
					         $('#messages').addClass('message');
			            },
			            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
			        });
	        	});
	        	$('input[name=drugTestInitiated]').change(function() {
			        $.ajax({
			            url: "${createLink(action:'drugTestInit')}", 
			            data: "id="+$(this).attr('reqCandiId'),
			            type: "POST",
			            dataFilter: function(data) { return data; },
			            success: function(data) {
			                 $('#messages').html('drug test initiated'); 
					         $('#messages').addClass('message');
			            },
			            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
			        });
	        	});
	        	$('input.drugTest').change(function() {
			        $.ajax({
			            url: "${createLink(action:'drugTest')}", 
			            data: "id="+$(this).attr('reqCandiId')+'&result='+$(this).val(),
			            type: "POST",
			            success: function(data) {
			                 $('#messages').html('drug test updated'); 
					         $('#messages').addClass('message');
			            },
			            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
			        });
			        if ($(this).val() == 'true') {
			        	$('#startDate'+$(this).attr('candidateId')).show();
			        }
	        	});
	            $('.reject').click(function() { 
	                $(this.parentElement).parent().remove();
		            $.ajax({
		                url: "${createLink(action:'updateRank')}", 
		                data: "id="+$(this).attr('reqCandiId')+"&rank=-1",
		                type: "POST",
		                success: function(data) {
				            $('#messages').html('Rejected candidate');
					        $('#messages').addClass('message');
		                },
		                error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
		            });
	            });
		        	
	        </g:javascript>
		</g:if>        
    </body>
</html>
