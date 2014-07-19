<%@ page import="daffron.fms.hr.recruiting.TestScore" %> 

<g:each in="${candidate?.testScores}" var="score"> 
	<tr>
		<td>${score.test.name}</td>
		<td>${score.score()}</td>
	</tr>
</g:each>
		