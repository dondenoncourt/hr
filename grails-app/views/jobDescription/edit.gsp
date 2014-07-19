<%@ page import="daffron.fms.hr.recruiting.JobDescription" %>
<%@ page import="daffron.fms.hr.recruiting.JobClassDescription" %>
<%@ page import="daffron.fms.hr.recruiting.YesNo" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="recruiting" />
        <g:set var="entityName" value="${message(code: 'jobD.label', default: 'JobDescription')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
	    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
	    <g:if test="${flash.message}">
	    <div class="message">${flash.message}</div>
	    </g:if>
	    <g:hasErrors bean="${jobD}">
	    <div class="errors">
	        <g:renderErrors bean="${jobD}" as="list" />
	    </div>
	    </g:hasErrors>
	    <g:form method="post" name="jobDForm">
	        <g:hiddenField name="id" value="${jobD?.id}" />
	        <g:hiddenField name="prodJobD.id" id="prodJobDId" value="${jobD?.prodJobD?.id}" />
	        <g:hiddenField name="reqId" id="reqId" value="${params.reqId}" />
	        <g:hiddenField name="version" value="${jobD?.version}" />
	        <div class="dialog">
               <table class="recruitment">
                   <tbody>                 
                       <tr class="prop">
                           <td valign="top" class="name"><label for="jobClass">Job Class</label></td>
                           <td valign="top" class="value ${hasErrors(bean: jobD, field: 'yesNo', 'errors')}">
	                           <% if (jobD.jobClass.id) { %>
	                               ${jobD.jobClass}
	                               <g:hiddenField name="jobClass.id" value="${jobD.jobClass.id}" />
		                           <% } else { %>
		                               <g:select name="jobClass.id" from="${JobClassDescription.list()}" optionKey="id" size="1" value="${jobD?.jobClass?.id}" />
		                           <% } 
		                       %>
                           </td>                          
                       </tr>
                       
                       <tr class="prop">
                           <td valign="top" class="name"><label for="unionJob"><g:message code="jobD.unionJob.label" default="unionJob Job" /></td>
                           <td valign="top" class="value ${hasErrors(bean: jobD, field: 'unionJob', 'errors')}">
                               <g:checkBox name="unionJob" value="${jobD?.unionJob}" />
                           </td>
                       </tr>
                       
                       <tr class="prop">
                           <td valign="top" class="name"><label for="cdlRequired"><g:message code="jobD.cdlRequired.label" default="CDL Required" /></label></td>
                           <td valign="top" class="value ${hasErrors(bean: jobD, field: 'cdlRequired', 'errors')}">
                               <g:checkBox name="cdlRequired" value="${jobD?.cdlRequired}" />
                           </td>
                       </tr>
                       
                       <tr class="prop">
                            <td valign="top" class="name"><label for="yesNo"><g:message code="jobD.yesNo.label" default="Yes No" /></label></td>
                            <td valign="top" class="value ${hasErrors(bean: jobD, field: 'yesNo', 'errors')}">
                                <g:select class="YesNoList" name="yesNo" from="${YesNo.list()}" multiple="yes" optionKey="id" size="5"  value="${jobD?.yesNo*.id}" />
                            </td>
                       </tr>
                       
                       <tr class="prop">
                           <td valign="top" class="name"><label for="job"><g:message code="jobD.job.label" default="Job" /></label></td>
                           <td valign="top" class="value ${hasErrors(bean: jobD, field: 'job', 'errors')}">
                               <g:textArea class="jobDescList" name="job" value="${jobD?.job}" />
                           </td>
                       </tr>
                       
                       <tr class="prop">
                           <td valign="top" class="name"><label for="adInternal"><g:message code="jobD.adInternal.label" default="Ad Internal" /></label></td>
                           <td valign="top" class="value ${hasErrors(bean: jobD, field: 'adInternal', 'errors')}">
                               <g:textArea class="jobDescList" name="adInternal" value="${jobD?.adInternal}" />
                           </td>
                       </tr>
                       
                       <tr class="prop">
                           <td valign="top" class="name"><label for="adExternal"><g:message code="jobD.adExternal.label" default="Ad External" /></label></td>
                           <td valign="top" class="value ${hasErrors(bean: jobD, field: 'adExternal', 'errors')}">
                               <g:textArea class="jobDescList" name="adExternal" value="${jobD?.adExternal}" />
                           </td>
                       </tr>
                       
                       <tr class="prop">
                           <td valign="top" class="name"><label for="techNeeds"><g:message code="requisition.techNeeds.label" default="Tech Needs" /></label></td>
                           <td valign="top" class="value ${hasErrors(bean: req, field: 'techNeeds', 'errors')}">
                               <g:select class="YesNoList" name="techNeeds" from="${daffron.fms.hr.recruiting.TechNeed.list()}" multiple="yes" optionKey="id" size="5" value="${jobD?.techNeeds*.id}" />
                           </td>
                       </tr>
                       
                       <tr class="prop">
                           <td valign="top" class="name"><label for="tests">Tests</label></td>
                           <td valign="top" class="value ${hasErrors(bean: req, field: 'techNeeds', 'errors')}">
                               <g:select class="YesNoList" name="tests" from="${daffron.fms.hr.recruiting.Test.list()}" multiple="yes" optionKey="id" size="5" value="${jobD?.tests*.id}" />
                           </td>
                       </tr>
                       
                       <tr class="prop">
                           <td valign="top" class="name"><label for="emailQuiz">emailQuiz</label></td>
                           <td valign="top" class="value ${hasErrors(bean: jobD, field: 'emailQuiz', 'errors')}">
                               <g:textArea class="jobDescList" name="emailQuiz" value="${jobD?.emailQuiz}"   />
                           </td>
                       </tr>
                       
                       <tr class="prop">
                           <td valign="top" class="name"><label for="phoneQuiz">Phone Interview Questions</label></td>
                           <td valign="top" class="value ${hasErrors(bean: req, field: 'phoneQuiz', 'errors')}">
                               <g:textArea class="jobDescList" name="phoneQuiz" value="${jobD?.phoneQuiz}"   />
                           </td>
                       </tr>
                   </tbody>
               </table>
            </div>
	        <div class="linkBtns buttons">
	           	<g:actionSubmit class="save button" action="${jobD.id?'update':'save'}" value="${jobD.id?'Update':'Save Changes'}"  />
	            <g:if test="${copyOfJobD}">
	       <g:link class="approve button" action="superOkJobD" id="${params.reqId}" title="Approve current Job Description with no changes and go to the requisition list">OK JobD with No Changes</g:link>
	            </g:if>
	            <g:else>
	            	<g:actionSubmit class="delete button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
	            </g:else>
	        </div>
	    </g:form>
        <g:render template="javascript"/>
        <g:javascript>
        	$('input[value=Save][type=submit]').hide();
            $('input, textarea, select').change(function() {
	        	$('input[value=Save][type=submit]').show();
            });
        </g:javascript>
    </body>
</html>
