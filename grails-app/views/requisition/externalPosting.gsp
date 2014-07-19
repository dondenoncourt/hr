<%@ page import="daffron.fms.hr.recruiting.JobDescription" %>
<%@ page import="daffron.fms.hr.recruiting.JobClassDescription" %>
<%@ page import="daffron.fms.hr.recruiting.YesNo" %>

<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="recruiting" />
        <r:require module="common"/> 
        <title>External Job Posting</title>
    </head>
    <body>
	    <h1>External Job Posting</h1>
	    <g:if test="${flash.message}">
	    <div class="message">${flash.message}</div>
	    </g:if>
	    <g:hasErrors bean="${jobD}">
	    <div class="errors">
	        <g:renderErrors bean="${jobD}" as="list" />
	    </div>
	    </g:hasErrors>
	    <g:form method="post">
	        <g:hiddenField name="id" value="${req?.id}" />
	        <div class="dialog">
	        	<g:textArea name="adExternal" value="${req.jobD?.adExternal}"  />
	        </div>
	        <div class="buttons">
            	    <g:link class="list button" action="list" controller="requisition" title="Requisition List">Req List</g:link>
	               	<g:actionSubmit class="post button" action="externalPosted" value="Post" />
	        </div>
	    </g:form>
    </body>
</html>
