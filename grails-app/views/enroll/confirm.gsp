<%@ page import="daffron.fms.hr.enrollment.Beneficiary" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="enrollTab" />
        <g:if test="${(!params.pdf)}">
	        <link href="${createLinkTo(dir: 'css', file: 'enrollment.css')}" rel="stylesheet" type="text/css"/>
	        <link href="${createLinkTo(dir: 'css', file: 'readOnly.css')}" rel="stylesheet" type="text/css"/>
        </g:if>
        <g:if test="${params.pdf}">        	
        	<link rel="stylesheet" href="${resource(dir:'css',file:'enrollFormPDF.css')}"  media="print"/>
        </g:if>
        <r:require module="common"/>
        <g:set var="entityName" value="${message(code: 'enroll.label', default: 'Enroll')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title> 
        <% if (!params.pdf) { %> 
        <script type="text/javascript">
        window.onload = disableAllFields;
        	
	        function disableAllFields(){
	        	var f = document.getElementsByTagName('input');
	        	var s = document.getElementsByTagName('select');
	        	for(var i=0;i < f.length;i++){
	        		if(f[i].getAttribute('type')=='text'|| f[i].getAttribute('type')=='checkbox'||f[i].getAttribute('type')=='radio'){
	        			f[i].setAttribute('disabled',true)
	       			}
	        		if(f[i].getAttribute('type')=='radio'){
	        			f[i].setAttribute('class','radio')
	       			}
	       			if(f[i].getAttribute('type')=='button'){
						f[i].setAttribute('style', 'display: none')
		       			}
	        	}
	        	for(var i=0;i < s.length;i++) {
					s[i].setAttribute('disabled', true)
		        	}
	       	}
        </script> 
		<% } %>
    </head>
    <body>
        <div class="enrollContent">
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${enroll}">
	            <div class="errors">
	                <g:renderErrors bean="${enroll}" as="list" />
	            </div>
            </g:hasErrors>
            
        	<div>${enroll?.employee?.name?:'no enrollment'}</div><br />
        	<% if (!params.pdf) { %> 
	        	<div class="icons">
	            	<g:link class="print" title="Printer Friendly" />
	            	<g:link controller="pdf" action="show" params="[url:'/enroll/confirm/'+enroll.id]" class="pdf" title="Export to PDF" />
	            </div> 
			<% } %>
        	<g:render template="contactInfoEdit" model="[enroll:enroll, confirmPage:true, pdf:params.pdf]" />
        	      	
        	<g:render template="healthPlanEdit" model="[enroll:enroll, confirmPage:true, pdf:params.pdf]" />
        	
        	<g:render template="cafeteriaEdit" model="[enroll:enroll, confirmPage:true, pdf:params.pdf]" />
        	
        	<fieldset id="voluntaryInsuranceFieldSet" style="margin-bottom: 5px;">
				<legend>VoluntaryInsurance</legend>
					<g:render template="voluntaryInsurance" model="[enroll:enroll, confirmPage:true, pdf:params.pdf]" />
			</fieldset>  
			
            <g:each in="${Beneficiary.BENEFICIARY_TYPES}" var="beneType">
				<g:render template="beneficiaryInfoEdit" model="[enroll:enroll, beneType:beneType, confirmPage:true, pdf:params.pdf]" />
			</g:each>
        </div>
</body>
</html>
