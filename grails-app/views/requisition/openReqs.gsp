<%@ page import="daffron.fms.hr.recruiting.Requisition" %>
<%@ page import="daffron.fms.hr.recruiting.Candidate" %>
        <h1>Open Requisitions</h1>
        <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
        </g:if>
		<table class="recruitment">
			<thead>
		           <tr>
		              <th style="width:20px;">Req No</th>
		              <th style="width:80px;">Supervisor</th>
		              <th>Title</th>
	              </tr>
		    </thead>
		    <tbody>
		    <g:each in="${list}" status="i" var="req">
		        <tr class="${(i % 2) == 0 ? 'odd' : 'even'} dblClick" 
		            id="${req.id}" 
		            title="Double Click to assisgn ${candidate.name} to req no:${req.id}/${req.jobD}">
		            <td>${req.id}</td>
		            <td>${req.supervisor.name}</td>
		            <td id="jobTitle${req.id}">${fieldValue(bean: req, field: "jobD")}</td>
		        </tr>
		    </g:each>
		    </tbody>
		</table>
		<r:script disposition="head">
			$('.dblClick').dblclick(function() {
			    var candiId = $(this).attr('id');
			    $.ajax({
			       url: "${createLink(controller:'requisition',action:'assignCandiToReq')}", 
			       data: "id="+candiId+"&candiId=${candidate.id}",
			       type: "POST",
			       success: function(data) {
			           $('#candidate${candidate.id}').html($('#candidate${candidate.id}').html()+' '+candiId);
					   $( "#selectReq" ).dialog('close');
			       },
			       error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
			    });
			});
		</r:script>

		<r:layoutResources/>      