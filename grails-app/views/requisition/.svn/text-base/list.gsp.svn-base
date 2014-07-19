<%@ page import="daffron.fms.hr.recruiting.Requisition" %>
<%@ page import="daffron.fms.hr.recruiting.Candidate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="recruiting" />
	    <r:require module="common"/>
        <title>Requisition Personnel List</title>
    </head>
    <body>${req }
	    <h1>Application Tracking</h1>
	    <a id="statusHelp" class="help button" title="click to see descriptions of status codes"></a><br />
	    <g:if test="${flash.message}">
	    <div class="message">${flash.message}</div>
	    </g:if> 
	    <div id="hoverMenu"> </div>
	    <div class="clear"></div>
	       <table class="recruitmentList">
	           <thead>
	               <tr>
	                   <g:sortableColumn property="id" title="${message(code: 'requisition.id.label', default: 'Req No')}" />
	                   <g:sortableColumn property="supervisor" title="${message(code: 'requisition.supervisor.label', default: 'Super')}" />
	                   <th class="sortable">
						    <g:link action="list" params="[sort:'status',max:params.max,order:params.order?(params.order=='asc'?'desc':asc):'asc']">Status</g:link>            				
   			           </th>
	                   <th><g:message code="requisition.jobD.label" default="Title" /></th>
	                   <g:sortableColumn property="dateCreated" title="Elapsed Days" />
	                   <th>Applicant Count</th>
	                   <g:sortableColumn property="dateNeeded" title="${message(code: 'requisition.dateNeeded.label', default: 'Deadline')}" />
	                   <g:sortableColumn property="interview" title="${message(code: 'requisition.interview.label', default: 'Interview')}" />
	                   <g:sortableColumn property="dateCreated" title="${message(code: 'requisition.interview.label', default: 'Created')}" />
	               </tr>
	           </thead>
	           <tbody>
	           <g:each in="${reqList}" status="i" var="req">
	               <tr class="${(i % 2) == 0 ? 'odd' : 'even'} menuLink" 
	                   id="${req.id}" 
	                   title="Click to display menu options for request no: ${req.id} ${req.jobD}">
	                   <td >${req.id}</td>
	                   <td>${req.supervisor}</td>
	                   <td>${req.status?.id}</td>
	                   <td id="jobTitle${req.id}">${fieldValue(bean: req, field: "jobD")}</td>
	                   <td>${(groovy.time.TimeCategory.minus( new Date(), req.dateCreated).days ) }</td>
	                   <td><g:if test="${req.candidates.size() > 0}">
	                           <g:link controller="candidate" action="list" id="${req.id}" title="Click to view candidates.">${req.candidates.size()}</g:link>
	                       </g:if>
	                       <g:else>
	                           ${req.candidates.size()}
	                       </g:else>
                       </td>
	                   <td><g:formatDate date="${req.dateNeeded}" format="MM-dd-yyyy"/></td>
	                   <td><g:formatDate date="${req.interview}" format="MM-dd-yyyy" /></td>
	                   <td><g:formatDate date="${req.dateCreated}" format="MM-dd-yyyy"/></td>
	                   <td style="display: none;"><%-- used to hold hidden link for double click --%>
                          <g:if test="${session.user.hrAdmin}">
                              <a href="${request.contextPath}/${req.status.nextPageHr}/${req.id}" class="hide dblclick">hr</a>
                          </g:if> 
                          <g:elseif test="${session.user.employee?.supervisor}">
                              <a href="${request.contextPath}/${req.status.nextPageSuper}/${req.id}" class="hide dblclick">super</a>
                          </g:elseif>
                          <g:else>
                              <a href="${request.contextPath}/requisition/show/${req.id}" class="hide dblclick">super</a>
                          </g:else>
                       </td>
	                   
	               </tr>
	           </g:each>
	           </tbody>
	       </table>
	    <div class="paginateButtons">
	        <g:paginate total="${reqTotal}" />
	    </div>
	    <g:if test="${session.user.employee?.supervisor || session.user.hrAdmin}">
			<div class="buttons linkBtns">
			    <g:link class="add button" action="create">New Requisition</g:link>
			</div>
		</g:if>
		<div id="statusHelpPopup" class="hide"> </div>
        <g:javascript>
            
            $('#statusHelp').click(function() {
                $('#statusHelpPopup').dialog();
		        $.ajax({
		            url: "${createLink(controller:'requisition', action:'statusHelp')}", 
		            type: "POST",
		            success: function(data) { 
		              $('#statusHelpPopup').html(data);
		              $('#statusHelpPopup').show();
		            }
		        });
            });
		    $('.menuLink').dblclick(function() {
		       window.location =  $('td a.dblclick', this).attr('href');
		    });
		    $('.menuLink').click(function() {
		    	$('#hoverMenu').html('');
				$('#spinner').ajaxStart(function() {
					$(this).fadeIn();
				}).ajaxStop(function() {
					$(this).fadeOut();
				});
		    	var reqId = $(this).attr('id');
	        	if (window.console) console.log("build hover menu with request id:"+reqId);
		        $.ajax({
		            url: "${createLink(controller:'requisition', action:'hoverMenu')}", 
		            data: "id="+reqId,
		            type: "POST",
		            success: function(data) {
		                $('#hoverMenu').html(data);
		            }
		        });
	        	
		    	$('#hoverMenu').show();
		    	$('#hoverMenu').mouseleave(function() {$('#hoverMenu').hide();});
		    });
		    var cancel
		    $('tr.menuLink').hover(
		        function() { // enter row
			    	$(this).addClass('hover');
					var reqId = $(this).attr('id');
			    	cancel = setTimeout('hoverMenuBuild('+reqId+')', 1250);
		    	}, 
		    	function() { // exit row
		    	    clearTimeout(cancel); // don't build the hover menu
		    	    $(this).removeClass('hover');
		        	//if (window.console) console.log("cancel hover for"+cancel);
			    }
			);
		    function hoverMenuBuild(reqId) {
	        	if (window.console) console.log("build hover menu with request id:"+reqId); 
		        $.ajax({ 
		            url: "${createLink(controller:'requisition', action:'hoverMenuBuild')}",  
		            data: "id="+reqId, 
		            type: "POST"
		        });
            } 
        </g:javascript>
    </body>
</html>
