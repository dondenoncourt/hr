<%@ page import="daffron.fms.hr.recruiting.Candidate" %>
<%@ page import="daffron.fms.hr.recruiting.Requisition" %>
<%@ page import="daffron.fms.hr.recruiting.RequisitionStatus" %>
<%@ page import="daffron.fms.hr.recruiting.YesNoAns" %>

<html>
<head> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="recruiting" />
    <g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'recruitment.css')}" />
    <r:require module="common"/>
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
    <g:javascript src="jquery.min.js"/>
    <g:javascript src="jquery-ui.min.js"/>
</head>
<body> 
	<g:if test="${flash.message}"><div class="message">${flash.message}</div></g:if>
	<g:set var="supervisor" value="${(req.status.id == 'SUPERSELECT')}"/>
	<h1>Candidate Filter: ${RequisitionStatus.get(req.status.id)?.desc}</h1>       
	<div>
		<div id="twoColLeft">
		    <h2>Candidates to Filter</h2>
		    <table id="unselectedTable" class="candFilter droppable">
		     <thead>
		        <tr>
		            <th>Name</th>
		            <th class="rank">% match</th>
		           </tr>
		        </thead>
		     <tbody>
		         <g:each in="${unfiltered}" var="reqCandi">
		             <tr id="candidate${reqCandi.id}" >
		               <g:if test="${reqCandi.candidate.created > req.lastUpdated}">
		                 <td class="candidateName" style="background-color: #fcf8b9;">
		                   <g:link action="show" class="newCandi" id="${reqCandi.candidate.id}">NEW! ${reqCandi.candidate.name}</g:link>	                   
	                     </td>
	                   </g:if>
	                   <g:else>
	                     <td class="candidateName">
	                       <g:link action="show" id="${reqCandi.candidate.id}">${reqCandi.candidate.name}</g:link>                    
	                     </td>
	                   </g:else>
		                 <td>${reqCandi.candidate.matchPercent()}</td>
				         <g:if test="">	
						   <td title="added ${g.formatDate(date:reqCandi.candidate.created, type:'datetime', style:'MEDIUM')}">NEW</td>
						 </g:if>
		             </tr>
		         </g:each>
		     </tbody>
		 </table>
		</div>
		<div id="twoColRight">
		    <h2>Top Candidates</h2>
		    <table id="topTable" class="candFilter droppable">
		        <thead>
		            <tr>
		                <th class="rank">Rank</th>
		                <th class="candidateName">Name</th>
		            </tr>
		        </thead>
		        <tbody id="topTableBody">
		            <g:render template="topCandidates" model="[supervisor:supervisor]"/>
		        </tbody>
		    </table>            
		    <br /><br /><br /><br />
		    <h2>Rejected</h2>
		    <table id="rejectedTable" class="candFilter droppable">
		        <thead><tr><th>Name</th></tr></thead>
		        <tbody>
		            <g:each in="${rejected}" var="reqCandi">
		                <tr id="candidate${reqCandi.id}" >
		                    <td class="candidateName"><g:link action="show" id="${reqCandi.id}">${reqCandi.candidate.name}</g:link></td>
		                </tr>
		            </g:each>
		        </tbody>
		    </table>
		    <br /><br /><br /><br />
		</div>
	</div>
</div>
	<div class="buttons linkBtns">
        <a class="list button" href="#" title="Requisition List">Req List</a>
        <g:if test="${req.candidates}">
	        <a class="save button next" href="#" title="Move from ${req.status.id} to the next status" >Next</a>
        </g:if>
	</div>    
    <g:if test="${!params.pdf}">
	    <g:javascript>
	        $('a.list.button').click(function() { 
	          setTimeout(function () {window.location = "${createLink(controller:'requisition',action:'list')}"}, 2000); 
	        });
	        $('a.next.button').click(function() { 
				<% if (supervisor) { %>
		           var no99s = true;
		            $('#topTableBody').find(".rank").each(function(){
		               if ($(this).text().trim() == '99') {
		                   no99s = false;
		               }
					});
					if (no99s == false) {
					    alert('Please rank all Top Candidates before clicking Next.');
					    return;
					}
			    <% } %>
	    		if (confirm('Are you sure? This will advance the requisition status from ${req.status.id} to ${nextStatus}')) {
					setTimeout(function () {window.location = "${createLink(controller:'requisition',action:'next',id:req.id)}"}, 1000); 
				} 
	        });
	        
	        $( "#unselectedTable tr" ).draggable();
	        $( "#topTable tr" ).draggable();
	        $( "#rejectedTable tr" ).draggable();
	        
	        $( ".droppable" ).droppable({
		        activeClass: "ui-state-hover",
		        hoverClass: "ui-state-active",
		        drop: function( event, ui ) {
		            var dragToId = $(this).attr("id");
	                var srcElem = ui.helper;
	                var candiNameLink = $(srcElem).find('.candidateName a');
	                var classId = $(srcElem).attr('id');
	                console.log("srcElem: "+srcElem);
	                console.log(srcElem);
	                console.log($(srcElem).attr('id'));
	                console.log("dragToId: "+dragToId);
		            $( this ).addClass( "ui-state-highlight" );
		            console.log(candiNameLink);
		            var nameTD = '<td class="candidateName"><a href="'+candiNameLink.attr('href')+'">'+candiNameLink.text()+'</a></td>';
		            if (dragToId == 'topTable') {
			        	var tr = '<tr id="' + classId + '">'+
					        '<td>99'+
								<% if (supervisor) { %>
					             '<a class="up"   title="click to move the rank up">  <img src="${resource(dir:'images',file:'arrow_up.png')}"  /></a>'+
					             '<a class="down" title="click to move the rank down"><img src="${resource(dir:'images',file:'arrow_down.png')}"/></a>'+
					            <% } %>
					        '</td>'+
					           nameTD+
						    '</tr>';
	    	            $('#'+dragToId).append(tr);
					    setUpDownHandlers();
						updateRank(classId, 99);
		            } else if (dragToId == 'unselectedTable') { 
	    	            $('#'+dragToId).append('<tr id='+classId+'">'+nameTD+'</tr>');
						updateRank(classId, 0);
		            } else if (dragToId == 'rejectedTable') {
	    	            $('#'+dragToId).append('<tr id='+classId+'">'+nameTD+'</tr>');
						updateRank(classId, -1);
		            }
		            srcElem.remove();
			        $( "#unselectedTable tr" ).draggable();
			        $( "#topTable tr" ).draggable();
			        $( "#rejectedTable tr" ).draggable();
		        }
		    });
			
			function updateRank(candidateId, rank ) {
				var rowId = parseDatabaseId(candidateId);
	            $.ajax({
	                url: "${createLink(action:'updateRank')}", 
	                data: "id="+rowId+"&rank="+rank,
	                type: "POST",
	                success: function(data) {if (window.console) console.log(rowId+' updated via by updateRank closure')},
	                error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
	            });
			} 
			function parseDatabaseId(variable) {
				variable.match(/[a-zA-Z]*(\d*)/);
				var rowId = RegExp.$1;
				if (window.console) console.log(rowId);
				return rowId;
			}
			
			function setUpDownHandlers() {
				$(".up,.down").click(function(){
			       var row = $('#topTableBody tr:first');
			       var direction = 'not set';
			       if ($(this).is(".up")) {
			           row.insertBefore(row.prev());
			           direction = 'up';
			       } else {
			           row.insertAfter(row.next());
			           direction = 'down';
			       }
				   var rowId = parseDatabaseId($(row).attr('id'));
			       $.ajax({
			            url: "${createLink(action:'bubbleRank')}", 
			            data: "id="+rowId+"&direction="+direction,
			            type: "POST",
			            success: function(data) {
			            		$('#topTableBody').html(data);
								setUpDownHandlers();
			           	},
			        });
			    });
			}
			setUpDownHandlers();
		
	 	</g:javascript>
 	</g:if>
</body>
</html>
