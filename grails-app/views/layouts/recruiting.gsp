<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head xmlns="http://www.w3.org/1999/xhtml">
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'buttons.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    	<g:if test="${params.pdf}">
        	<link rel="stylesheet" href="${resource(dir:'css',file:'recruitementPdf.css')}" />
        </g:if>
	    <r:require module="jquery"/>
	    <r:require module="jquery-ui"/>
		<g:javascript src="application.js" />
        <g:if test="${session.user && !params.pdf}">
    		<g:render template="/layouts/dropdownmenu_js"></g:render>
    	</g:if>
	    <r:require module="common"/>
	    <r:require module="recruitment"/>
        <g:layoutHead />
        
		<r:layoutResources/>      
    </head>
    <body>
    	<g:if test="${!params.pdf}">
    		<g:render template="/layouts/header"></g:render>
		</g:if>
		<div class="body">
	        <div id="spinner" class="spinner" style="display:none;">
			    <r:img uri="/plugins/payrolldb-0.1/images/spinner.gif"  alt="${message(code:'spinner.alt',default:'Loading...')}"/>
	        </div>
		  <div class="content">
		      <g:layoutBody />
		  </div>
		</div>        
		<r:layoutResources/>      
    </body>
</html> 