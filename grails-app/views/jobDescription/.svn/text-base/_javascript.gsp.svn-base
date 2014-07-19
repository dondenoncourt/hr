<%@ page import="daffron.fms.hr.recruiting.JobDescription" %>
<g:javascript>
	$('#jobDForm :input').keydown( function() {
		$('.buttons .button input').show();
	});
	$('#jobDForm :input').change( function() {
		$('.buttons .button input').show();
	});
	<g:each in="${['job','adInternal','adExternal']}" var="textAreaCol">
			<%-- the 50 is for extra odd characters like carriage control line feeds and such --%>
			<g:set var="maxSize" value="${JobDescription.constraints[textAreaCol]?.maxSize-50}" />
			
 		$("#${textAreaCol}").keyup(function(){
 			if($(this).val().length > ${maxSize}){
        $(this).val($(this).val().substr(0, ${maxSize}));
        alert('Entered text is greater than the limit of ${maxSize}, your input has been truncated.');
		}
	});
	</g:each>
</g:javascript>
