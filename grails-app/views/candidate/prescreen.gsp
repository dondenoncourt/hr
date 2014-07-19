<%@ page import="daffron.fms.hr.recruiting.Candidate" %>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="recruiting" />
	    <r:require module="common"/>
        <title>Prescreen for ${req}</title>
    </head>
    <body>
        <h1>Prescreen ${req}</h1>
        <div id="messages" class="${flash.message?'message':''}">${flash.message}</div>
        <div >
            <h2>eMail Questions:</h2>
            ${req.jobD.emailQuiz.encodeAsHTML().replaceAll(/\n/, '<br/>').replaceAll(/&.*;/,' ')}
            <g:if test="${req.jobD.phoneQuiz?.trim()}">
	            <h2>Phone Interview Questions:</h2>
	            ${req.jobD.phoneQuiz.encodeAsHTML().replaceAll(/\n/, '<br/>').replaceAll(/&.*;/,' ')}
            </g:if>
            <div class="list">
                <table class="recruitment">
                    <thead>
                        <tr><th>Name</th><th>eMail Reply</th><th>Additional Phone Questions</th><th>Reject</th></tr>
                    </thead>
                    <tbody>
	                    <g:each in="${candidateList}" var="reqCandi">
							<tr>
								<td>${reqCandi.candidate}</td>
								<td><g:textArea name="emailQuizResponse" class="emailQuiz" value="${reqCandi.emailQuizReply?.encodeAsHTML()?.replaceAll(/&.*;/,' ')}" reqCandiId="${reqCandi.id}" size="80"/></td>
							    <td><g:textArea name="phoneQuiz"         class="phoneQuiz" value="${reqCandi.     phoneQuiz?.encodeAsHTML()?.replaceAll(/&.*;/,' ')}"   reqCandiId="${reqCandi.id}" size="80"/></td>
								<td><g:radio name="reject" class="reject" value="false" reqCandiId="${reqCandi.id}" /></td>
   							</tr>
	                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="buttons linkBtns">    
            <a class="button list" href="#" title="Requisition List">Req List</a>
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
	            $('.emailQuiz').change(function() { 
			        $.ajax({
			            url: "${createLink(action:'setEmailQuizReply')}", 
			            data: "id="+$(this).attr('reqCandiId')+'&emailQuizReply='+$(this).val(),
			            type: "POST",
			            success: function(data) { $('#messages').html('Updated email quiz response'); },
			            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
			        });
			        $('#messages').addClass('message');
	            });
	            $('.phoneQuiz').change(function() { 
			        $.ajax({
			            url: "${createLink(action:'setPhoneQuiz')}", 
			            data: "id="+$(this).attr('reqCandiId')+'&phoneQuiz='+$(this).val(),
			            type: "POST",
			            success: function(data) { $('#messages').html('Updated phone quiz'); },
			            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
			        });
			        $('#messages').addClass('message');
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
	           function setPhoneInterview(id, hrRank) {
                   $.ajax({
                        url: "${createLink(action:'setPhoneInterview')}", 
                        data: "id="+id+'&hrRank='+hrRank,
                        type: "POST",
                        error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
                   });
                }
	        </g:javascript>
	    </g:if>
    </body>
</html>
 