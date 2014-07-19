<%@ page import="daffron.fms.hr.recruiting.Candidate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="recruiting" />
	    <r:require module="common"/>
        <title>List Candidates for a Job Opening</title>
    </head>
    <body>
	    <h1>Applicant List ${(req?"for $req":'')}</h1>
	    <g:if test="${flash.message}">
	    <div class="message">${flash.message}</div>
	    </g:if>
	    <div class="list">
	        <table class="recruitment">
	            <thead>
	                <tr>
	                   <th>Name</th>
	                   <th>Email</th>
	                   <th>Phone</th>
	                   <th>Rank</th>
	                   <th>Background Check</th>
	                   <th>Contacted for Test</th>
	                   <th>Interview</th>
	                </tr>
	            </thead>
	            <tbody>
	            <g:each in="${req.candidates}" status="i" var="reqCandi">
	                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                    <td><g:link action="show" id="${reqCandi.candidate.id}" params="[reqId:req.id]">${reqCandi.candidate.name}</g:link></td>
	                    <td>${reqCandi.candidate.email}</td>
	                    <td>${reqCandi.candidate.phoneNo}</td>
	                    <td>${reqCandi.rank}</td>
	                    <td><g:formatBoolean boolean="${reqCandi.backgroundCheck}" /></td>
	                    <td><g:formatDate date="${reqCandi.contactedForTest}" /></td>
	                    <td><g:formatDate date="${reqCandi.interview}" /></td>
	                </tr>
	            </g:each>
	            </tbody>
	        </table>
	    </div>
	    <div class="paginateButtons">
	        <g:paginate total="${req.candidates.size()}" />
	      </div>
	<div class="buttons linkBtns">
	 <g:link class="back button" action="list" controller="requisition" title="Requisition List">Req List</g:link>
	</div>
    </body>
</html>
