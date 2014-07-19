<%@ page import="daffron.fms.hr.recruiting.JobDescription" %>
<%@ page import="daffron.fms.hr.recruiting.Test" %>
<%@ page import="daffron.fms.hr.recruiting.YesNo" %>
<%@ page import="daffron.fms.hr.recruiting.TechNeed" %>
<%@ page import="org.codehaus.groovy.grails.commons.GrailsClassUtils" %>

<%@ page import="org.codehaus.groovy.grails.commons.ApplicationHolder" %>
<%@ page import="org.codehaus.groovy.grails.commons.DomainClassArtefactHandler" %>

<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="recruiting" />
		<g:javascript src="difflib.js"/>
		<g:javascript src="diffview.js"/>
        <g:set var="entityName" value="${message(code: 'jobDescription.label', default: 'JobDescription')}" />
        <title>Job Description Change Comparison</title>
		<g:javascript>
			function buildDiff(diffField, diffFieldLabel) {
				var base = difflib.stringAsLines(document.getElementById(diffField+"Prod").value);
				var newtxt = difflib.stringAsLines(document.getElementById(diffField+"Temp").value);
				var sm = new difflib.SequenceMatcher(base, newtxt);
				var opcodes = sm.get_opcodes();
				var diffoutputdiv = document.getElementById(diffField+"OutDiv");
				while (diffoutputdiv.firstChild) {
					diffoutputdiv.removeChild(diffoutputdiv.firstChild);
				}
				var contextSize = null; // might set from member
				diffoutputdiv.appendChild(
						diffview.buildView({ baseTextLines:base,
										   newTextLines:newtxt,
										   opcodes:opcodes,
										   baseTextName:"Production",
										   newTextName:"Super's Changes",
										   contextSize:contextSize,
										   viewType: 0 
						})
				);
			}
		</g:javascript>
    </head>
    <body>
        <div>
            <h1>Job Description Change Comparison</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
	            <g:form method="post" name="jobDForm">
	                <g:hiddenField name="id" value="${prodJobD?.id}" />
	                <g:hiddenField name="version" value="${prodJobD?.version}" />
	                <g:hiddenField name="reqId" value="${req.id}" />
		        	<g:each in="${tempJobD.diffProps(prodJobD)}" var="diffField">
		            	<h2><g:message code="jobDescription.${diffField}.label" default="${diffField}" /></h2>
		            	<% if (GrailsClassUtils.getPropertyType(JobDescription, diffField) == String) { %>
							<textarea rows="8" cols="80" id="${diffField}Prod" style="display:none;">${prodJobD[diffField]}</textarea>
						    <textarea rows="8" cols="80" id="${diffField}Temp" style="display:none;">${tempJobD[diffField]}</textarea>
							
						     <div id="${diffField}OutDiv" style="width:100%"> </div>
						     <g:textArea name="${diffField}" value="${prodJobD[diffField]}" style="display:none;" />
							 <g:javascript>
								 buildDiff('${diffField}', '<g:message code="jobDescription.${diffField}.label"/>');
								 $('#${diffField}AcceptChanges').click(function() {
									 $('#${diffField}').val($('#${diffField}Temp').val());
									 $('#${diffField}OutDiv').animate({width: "0"}, 500, function(){
										 $(this).remove();
									 });
									 $('#${diffField}AcceptChanges').hide();
									 $('.buttons .button input').show();
								 });
						     </g:javascript>
                             <div class="linkBtns changeBtns">								 
								 <a id="${diffField}AcceptChanges" class="copy button">Copy Changes</a>
							 </div>                               
				            
			            <% } else if (GrailsClassUtils.getPropertyType(JobDescription, diffField) == Set ) { 
			            	def prodMinusTemp = prodJobD[diffField] - tempJobD[diffField]
			            	def tempMinusProd = tempJobD[diffField] - prodJobD[diffField]
			        		def grailsApplication = ApplicationHolder.application
			        		def domainDescriptor = grailsApplication.getArtefact(DomainClassArtefactHandler.TYPE, "daffron.fms.hr.recruiting.JobDescription")
			        		def property = domainDescriptor.getPropertyByName(diffField)
			        		def setClass = grailsApplication.getArtefact(DomainClassArtefactHandler.TYPE, property.referencedDomainClass.fullName)
			           		%>
							<table id="${diffField}Table" class="recruitment">
							    <thead>
							        <tr>
							            <th>Production</th>
										<th class="superChanges">Super's Changes</th>
							        </tr>
							    </thead>
								<tbody>
									<tr class="prop">
										<td valign="top" class="name">
										    <g:select class="changes" name="${diffField}" from="${setClass.newInstance().list()}" multiple="yes" optionKey="id" size="5" value="${prodJobD[diffField]*.id}" />
										</td>
										<td class="superChanges" valign="top">
											<select class="changes" name="${diffField}Temp" id="${diffField}Temp" size="5"  multiple="multiple"  >
												<g:each in="${setClass.newInstance().list()}" var="obj">
													<option value="${obj.id}"
														class="<%= tempMinusProd.find{it.toString() == obj.toString()}?'added':' ' %><%= prodMinusTemp.find{it.toString() == obj.toString()}?'removed':' ' %>"
													>
														${obj}
													</option>
												</g:each>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="linkBtns changeBtns">
							<a id="${diffField}AcceptChanges" class="copy button">Copy Changes</a>
							</div>
			            	<g:javascript>
				            	$('#${diffField}AcceptChanges').click(function() {
				            		$('#${diffField}Temp option.added').each (function(index, value) {
				            			$('#${diffField} option[value='+$(value).val()+']').attr('selected', true);
				            		});
				            		$('#${diffField}Temp option.removed').each (function(index, value) {
				            			$('#${diffField} option[value='+$(value).val()+']').removeAttr('selected');
				            		});
				            		// toggle the size merely to force a repaint otherwise the un-selected doesn't show up
				            		var size = Number($('#${diffField}').attr('size'));
				            		$('#${diffField}').attr('size', ++size);
				            		$('#${diffField}').attr('size', --size);
									// turn on update button
									$('.buttons .button input').show();
								
									$('#${diffField}Table .superChanges').animate({width: "0"}, 500, function(){
					        			$(this).remove();
									});
									
				            	});
			            	</g:javascript>
			            <% } else { %>
			            	Application not coded to handle changes in ${diffField} with data type of
			            	${GrailsClassUtils.getPropertyType(JobDescription, diffField)}
			            <% } %>
		        	</g:each>
		        <br/>
                <div class="linkBtns buttons">
                 	<g:actionSubmit class="save button" action="update" value="Save Changes" />
		            <g:link class="list button" action="list" controller="requisition" title="Requisition List">Req List</g:link> 
		            <g:link class="update button" action="diff" controller="jobDescription" id="${req.id}" title="Refresh this job description">Refresh</g:link> 
                </div>
			 </g:form>
			</div>           
    </div>
    <g:render template="javascript"/>
    </body>
</html>
