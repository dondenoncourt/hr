<%@ page import="daffron.fms.hr.User" %>
<%@ page import="daffron.fms.hr.recruiting.Candidate" %>

<ul id="actionthumbnails"> 
	<g:each in="${controllerActionLinks}" var="controllerActionLink">
		<li>
			<a href="${createLink(action:controllerActionLink.action, controller:controllerActionLink.controller)}/${req.id}">
				<img src="${resource(dir:'images/transient')}/${session.user.id}_${controllerActionLink.controller}_${controllerActionLink.action}.png" />
			</a>
		</li>
	</g:each>
	
</ul>
<r:script disposition="head">
    $('#actionthumbnails a img').hover(function() {
    	$(this).addClass('hover');
    	$(this).mouseleave(function() {$(this).removeClass('hover');});
    });
</r:script>
<r:layoutResources/>      
