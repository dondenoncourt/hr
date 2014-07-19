<%@ page import="daffron.fms.hr.recruiting.Candidate" %>
<%@ page import="daffron.fms.hr.recruiting.TestScore" %>
<%@ page import="daffron.fms.hr.recruiting.Behavior" %>
<%@ page import="daffron.fms.hr.recruiting.BehaviorResult" %>
<%@ page import="grails.util.Environment" %>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="recruiting" />
	    <r:require module="common"/>
        <title>Test Comparison</title>
    </head>
    <body>
        <h1>Applicant Test Comparison ${req}</h1>
        <div id="messages" class="${flash.message?'message':''}">${flash.message}</div>
        <div class="twoColLeft">
            <div class="list">
                <table class="candFilter">
                    <thead>
                        <tr>
                        	<th>Test</th><th>Global Ave</th>
		                    <g:each in="${candidateList}" var="reqCandi">
		                    	<th><g:link  action="show" id="${reqCandi.candidate.id}">${reqCandi.candidate.name}</g:link></th>
		                    </g:each>
                        </tr>
                    </thead>
                    <tbody>
		           		<tr><td colspan="${candidateList.size()+2}"><h2>Standard</h2></td></tr>
	                    <g:each in="${req.jobD.tests.sort{name}}" status="i" var="test">
	                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                            <td>${test.name}</td>
	                            <td>${(int)(test.globalAveCorrect / test.questions  * 100)}</td>
			                    <g:each in="${candidateList.sort{rank}}" var="reqCandi">
			                    	<td>${TestScore.findByCandidateAndTest(reqCandi.candidate, test)?.score()?:' '}</td>
			                    </g:each>
	                        </tr>
	                    </g:each>
			           	<tr><td colspan="${candidateList.size()+2}"><h2>Behavioral</h2></td></tr>
	                    <g:each in="${Behavior.list().sort{name}}" status="i" var="behavior">
	                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                            <td>${behavior.name}</td><td/>
			                    <g:each in="${candidateList.sort{rank}}" var="reqCandi">
			                    	<% def result = BehaviorResult.findByCandidateAndBehavior(reqCandi.candidate, behavior)?.result %>
			                    	<td class="hover" title="${result} is <g:message code="behavior.result.${result}"/>">${result}</td>
			                    </g:each>
	                        </tr>
	                    </g:each>
						<tr>
							<td/><td/>
		                    <g:each in="${candidateList}" var="reqCandi">
								<td>
									<g:radio name="interviewReject${reqCandi.id}" class="interview interviewReject" value="I" reqCandiId="${reqCandi.id}" reqId="${req.id}"/> 
							        	<g:if test="${'DAFFRON' == Environment.getCurrent().name}">
									       Approve
									    </g:if>
									    <g:else>
									       Interview
									    </g:else>
									   <br/>
									<g:radio name="interviewReject${reqCandi.id}" class="reject interviewReject" value="R" reqCandiId="${reqCandi.id}" reqId="${req.id}"/> Reject
								</td>
		                    </g:each>
						</tr>                    
                    </tbody>
                </table>
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
				$("input.reject").live("click", function(){
					var myIndex = $(this).closest("td").prevAll("td").length;
					$(this).parents("table").find("tr").each(function(){
						$(this).find("td:eq("+myIndex+")").animate({width: "0"}, 1000, function(){
		        			$(this).remove();
						});
						$(this).find("th:eq("+myIndex+")").animate({width: "0"}, 1000, function(){
		        			$(this).remove();
						});
					});
					$(this).attr('id', 'ignoreItNow');// for some reason, the removed item is still in the DOM
			        $.ajax({
			            url: "${createLink(action:'reject')}", 
			            data: "id="+$(this).attr('reqCandiId'),
			            type: "POST",
			            success: function(data) {if (window.debug) console.log(data);},
			            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
			        });
				}); 
				$("input.interviewReject").live("click", function(){
					// if all radios selected, invoke picked action to update picked date (and rules may move to SINTD, schedule interview)
					var clickedReqCandiId = $(this).attr('reqCandiId');
					var allChecked = true;
					$("input.interview").each(function() {
						var reqCandiId = $(this).attr('reqCandiId');
						if (!$('#interviewReject'+reqCandiId).is(':checked') && 
						    $('#interviewReject'+reqCandiId).attr('reqCandiId') != clickedReqCandiId) {
							allChecked = false;
						}
					});
					if (allChecked) {
				        $.ajax({
				            url: "${createLink(controller:'requisition', action:'picked')}", 
				            data: "id="+$(this).attr('reqId'),
				            type: "POST",
				            success: function(data) {
				                if (window.debug) console.log('picked returned '+data);
				                $('#messages').html('Requisition flagged as candidate test scores reviewed.');
            			        $('#messages').addClass('message');
				            },
				            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
				        });
					}
				});
	        </g:javascript>
		</g:if>	
   </body>
</html>
