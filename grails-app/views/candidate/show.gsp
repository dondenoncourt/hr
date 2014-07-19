<%@ page import="daffron.fms.hr.recruiting.Candidate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="recruiting" />
        <g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'recruitment.css')}" />
	    <r:require module="common"/>
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
	    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
	    <g:if test="${flash.message}">
	    <div class="message">${flash.message}</div>
	    </g:if>
	       <table class="recruitment">
	           <tbody>
	               <tr class="prop">
	                   <td valign="top" class="name"><g:message code="candidate.id.label" default="Id" /></td>
	                   <td valign="top" class="value">${fieldValue(bean: candidate, field: "id")}</td>
	               </tr>
	               <tr class="prop">
	                   <td valign="top" class="name"><g:message code="candidate.email.label" default="Email" /></td>
	                   <td valign="top" class="value">${fieldValue(bean: candidate, field: "email")}</td>
	               </tr>
	               <tr class="prop">
	                   <td valign="top" class="name"><g:message code="candidate.name.label" default="Name" /></td>
	                   <td valign="top" class="value"><g:link action="show" id="${candidate.id}">${fieldValue(bean: candidate, field: "name")}</g:link></td>
	               </tr>
	               <tr class="prop">
	                   <td valign="top" class="name"><g:message code="candidate.phoneNo.label" default="Phone No" /></td>
	                   <td valign="top" class="value">${fieldValue(bean: candidate, field: "phoneNo")}</td>
	               </tr>
	               <tr class="prop">
	                   <td valign="top" class="name"><g:message code="candidate.created.label" default="Created" /></td>
	                   <td valign="top" class="value"><g:formatDate date="${candidate?.created}" /></td>
	               </tr>
	               <tr class="prop">
	                   <td valign="top" class="name"><g:message code="candidate.notes.label" default="Notes" /></td>
	                   <td valign="top" style="text-align: left;" class="value">
	                       <ul>
	                       <g:each in="${candidate.notes}" var="n">
	                           <li><g:link controller="note" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
	                       </g:each>
	                       </ul>
	                   </td>
	               </tr>
	               <tr class="prop">
	                   <td valign="top" class="name"><g:message code="candidate.position.label" default="Rank" /></td>
	                   <td valign="top" class="value">${fieldValue(bean: candidate, field: "rank")}</td>
	               </tr>
	               <tr class="prop">
	                   <td valign="top" class="name"><g:message code="candidate.requisition.label" default="Requisition" /></td>
	                   <td valign="top" class="value"><g:link controller="requisition" action="show" id="${candidate?.requisition?.id}">${candidate?.requisition?.encodeAsHTML()}</g:link></td>
	               </tr>
	               <tr class="prop">
	                   <td valign="top" class="name"><g:message code="candidate.testScores.label" default="Test Scores" /></td>
	                   <td valign="top" style="text-align: left;" class="value">
	                       <ul>
	                       <g:each in="${candidate.testScores}" var="t">
	                           <li><g:link controller="testScore" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
	                       </g:each>
	                       </ul>
	                   </td>
	               </tr>
	               <tr class="prop">
	                   <td valign="top" class="name"><g:message code="candidate.updated.label" default="Updated" /></td>
	                   <td valign="top" class="value"><g:formatDate date="${candidate?.updated}" /></td>
	               </tr>
	               <tr class="prop">
	                   <td valign="top" class="name"><g:message code="candidate.yesNoAns.label" default="Yes No Ans" /></td>
	                   <td valign="top" style="text-align: left;" class="value">
	                       <ul class="yesNo">
	                        <g:each in="${candidate.yesNoAns}" var="y">
	                            <li>
	                            	<% if (y.answer) { %>
	                            		<img src="${resource(dir:'images',file:'checkmark.gif')}"/>
	                            	<% } %>
	                            	${y.yesNo.question}
	                            </li>
	                        </g:each>
	                       </ul>
	                   </td>
	               </tr>
	           </tbody>
	       </table>
    </body>
</html>
