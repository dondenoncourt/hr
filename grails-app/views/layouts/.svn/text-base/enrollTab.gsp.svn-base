<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'header.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'enrollment.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'buttons.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'messages.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:javascript library="application" />
  		<g:javascript library="jquery" plugin="jquery"/>
  		<g:if  test="${session.user}">
    		<g:render template="/layouts/dropdownmenu_js"></g:render>
    	</g:if>
  		<g:layoutHead />
		<r:layoutResources/>      
  		
    </head>

    <body>
      	<% if (!params.pdf) { %>
			<g:render template="/layouts/header"></g:render>			
		<% } %>
		<div class="body">
            <div class="content">
	           <% if (!params.pdf) { %>
			        <!--  http://blixt.org/articles/tabbed-navigation-using-css -->
			        <ul id="toc">
					     <li><g:link class="" action="contactInfo" controller="enroll" id="${enroll.id}">Contact Info</g:link></li>
						 <li><g:link class="" action="healthPlan" controller="enroll" id="${enroll.id}">Health Plan</g:link></li>
			 			 <li><g:link class="" action="fsa" controller="enroll" id="${enroll.id}">Flex Spending(FSA)</g:link></li>
			 			 <li><g:link class="" action="voluntaryIns" controller="enroll" id="${enroll.id}">Voluntary Insurance</g:link></li>	            
			 			 <li><g:link class="" action="beneficiaryInfo" controller="enroll" id="${enroll.id}">Beneficiary Info</g:link></li>
						 <li><g:link class="" action="completeEnrollment" controller="enroll" id="${enroll.id}">Complete Enrollment</g:link></li>
					</ul>
					<div class="clear"></div>
					<% } %>			           
                <g:layoutBody />
            </div>
        </div> 
    
        <g:javascript>
			$('ul#toc li a').each(function() {
				var view = $('#view').val(); // hidden field that has the view name
				view.match(/([a-zA-Z]*)Edit/); // the view name is the action name plus the word Edit
				var action = RegExp.$1;  // get the action name from the hidden field's value
				if ($(this).attr('href').indexOf(action) != -1) { // if the view name is in the URL, make that tab current
					//if (this.debug) console.log($(this).attr('href')+' contains '+action);
					$(this).parent().addClass('current');
				}			
			});        	
        </g:javascript>
		<r:layoutResources/>      
    </body>
    
</html>