<%@ page import="daffron.fms.hr.recruiting.Candidate" %>
<g:each in="${top}" var="reqCandi">
	<tr id="candidate${reqCandi.id}" class="draggable">
		<td class="rank">${reqCandi.rank}
			<% if (supervisor) { %>
				<a class="up" title="click to move ${reqCandi.candidate.name}'s rank up"><img src="${resource(dir:'images',file:'arrow_up.png')}"/></a> 
				<a class="down" title="click to move ${reqCandi.candidate.name}'s rank down"><img src="${resource(dir:'images',file:'arrow_down.png')}" /></a>
			<% } %>
		</td>
		<td class="candidateName"><g:link action="show" controller="candidate" id="${reqCandi.candidate.id}">${reqCandi.candidate.name}</g:link></td>
	</tr>
</g:each>
