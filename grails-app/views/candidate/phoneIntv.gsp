<%@ page import="daffron.fms.hr.recruiting.Candidate" %>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="recruiting" />
	    <r:require module="common"/>
        <title>Prescreen for ${req}</title>
    </head>
    <body>
        <h1>Phone Interview ${req}</h1>
       	<div id="messages" class="${flash.message?'message':''}">${flash.message}</div>
        <div >
            <div class="list">
	            <h2>Pre-Screen Questions:</h2>
	            ${req.jobD.emailQuiz.encodeAsHTML().replaceAll(/&.*;/,' ').replaceAll(/\n/, '<br/>')}
	            <h3>Response:</h3>
	            <span id="prescreenResponse">Hover over candidate to view....</span>
	            <br/>
	            <h2>Phone Interview Questions:</h2>
	            <g:if test="${req.jobD.phoneQuiz}">
		            ${req.jobD?.phoneQuiz?.encodeAsHTML()?.replaceAll(/&.*;/,' ')?.replaceAll(/\n/, '<br/>')}
   	            </g:if>
   	            <h3>Candidate specific questions:</h3>
	            <span id="additionalQuestions">Hover over candidate to view....</span>
                <table class="recruitment"> 
                    <thead>
                        <tr>
                            <th>Name</th><th>Phone No</th>
                            <th>Phone Question Response</th>
                            <th>HR Rank</th>
                            <th>Reject</th>
                        </tr>
                    </thead>
                    <tbody>
	                    <g:each in="${candidateList}" var="reqCandi">
							<tr class="list">
        	                    <td><g:link action="show" id="${reqCandi.candidate.id}" params="[reqId:reqCandi.requisition.id]">${reqCandi.candidate}</g:link></td>
								<td><daffron:formatPhone phone="${reqCandi.candidate.phoneNo}"/></td>
							    <td><g:textArea name="phoneQuizReply" class="phoneQuizReply" value="${reqCandi.phoneQuizReply?.encodeAsHTML()?.replaceAll(/&.*;/,' ')}"   reqCandiId="${reqCandi.id}" /></td>
								<td>
									<g:select name="hrRank" class="setRank" from="${1..99}" value="${reqCandi.hrRank}" reqCandiId="${reqCandi.id}" noSelection="['':'- set rank -']"/>
								</td>
								<td><g:radio name="reject" class="reject" value="false" reqCandiId="${reqCandi.id}" /></td>
							    <td class="hide phoneQuiz">${reqCandi.phoneQuiz?.encodeAsHTML()?.replaceAll(/&.*;/,' ')}</td>
								<td class="hide prescreenResponse">${reqCandi.emailQuizReply.encodeAsHTML().replaceAll(/&.*;/,' ')}</td>
							</tr>
	                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="buttons linkBtns">    
            <a class="list button" href="#" title="Requisition List">Req List</a>
   	        <a class="save button next" href="#" title="Move from ${req.status.id} to the next status" >Next</a>
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
	            $('.setRank').change(function() { 
		           setPhoneInterview($(this).attr('reqCandiId'), $(this).val());
		           $('#messages').html('Candidate rank set');
			       $('#messages').addClass('message');
	            });
	            $('.reject').click(function() { 
	               $(this.parentElement).parent().remove();
			       setPhoneInterview($(this).attr('reqCandiId'), -1);
		           $('#messages').html('Rejected candidate');
			       $('#messages').addClass('message');
	            });
	           function setPhoneInterview(id, hrRank) {
                   $.ajax({
                        url: "${createLink(action:'setPhoneInterview')}", 
                        data: "id="+id+'&hrRank='+hrRank,
                        type: "POST",
                        error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
                   });
                }
	            
	            $('.phoneQuizReply').change(function() { 
			        $.ajax({
			            url: "${createLink(action:'setPhoneQuizReply')}", 
			            data: "id="+$(this).attr('reqCandiId')+'&phoneQuizReply='+$(this).val(),
			            type: "POST",
			            success: function(data) { $('#messages').html('Updated phone response'); },
			            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
			        });
			        $('#messages').addClass('message');
	            });
			    $('tr.list').hover(
			        function() { // enter row
				    	$(this).addClass('hover');
				    	$('#additionalQuestions').html($(this).children('.phoneQuiz').html());
				    	$('#prescreenResponse').html($(this).children('.prescreenResponse').html());
			    	}, 
			    	function() { // exit row
			    	    $(this).removeClass('hover');
				    	$('#additionalQuestions').html('<br/>');
				    	$('#prescreenResponse').html('');
				    }
				);
	        </g:javascript>
        </g:if>
    </body>
</html>