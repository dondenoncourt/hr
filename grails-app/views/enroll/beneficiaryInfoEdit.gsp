<%@ page import="daffron.fms.hr.enrollment.Beneficiary" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="enrollTab" />
        <link href="${createLinkTo(dir: 'css', file: 'enrollment.css')}" rel="stylesheet" type="text/css"/>
        <r:require module="common"/>
        <g:set var="entityName" value="${message(code: 'enroll.label', default: 'Enroll')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
      
    </head>
    <body>        
        <div class="enrollContent">
            <g:if test="${flash.message}">
	            <div class="general msg">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${enroll}">
	            <div class="errors msg">
	                <g:renderErrors bean="${enroll}" as="list" />
	            </div>
            </g:hasErrors>
            <div>
            </div>
            <g:form method="post" name="enrollmentForm" action="update">
                <g:hiddenField name="id" value="${enroll?.id}" />
                <g:hiddenField name="version" id="enrollId" value="${enroll?.version}" />
                <g:hiddenField name="view" value="beneficiaryInfoEdit" />
			</g:form>     
            
            <g:each in="${Beneficiary.BENEFICIARY_TYPES}" var="beneType">
				<g:render template="beneficiaryInfoEdit" model="[enroll:enroll, beneType:beneType]" />
			</g:each>
			<div class="clear"></div>
			<div class="nextBtn">
				<a href="#"  id="pageUpdateButton" title="Click to update Beneficiary information and continue to next tab">Confirm and Next</a>
			</div>		 					
		</div>

	<g:javascript>
	   $('#pageUpdateButton').click(function () {
			$('form').each(function() {
				console.log('force form');
				if (this.changed != null && this.changed.value == 'true') {
					console.log('input.save trigger');
					$('input.save', this).trigger("click");
				}
			});
			// verify share percentages add up to 100
			var verified = true;
			<g:each in="${Beneficiary.BENEFICIARY_TYPES}" var="beneType">
				var totalShares = Number(0);
				$('.share_${beneType.key}').each(function() {  
					totalShares += Number($(this).val());	
				});
				if (totalShares > 0 && totalShares != 100) {
					alert('Total Share % for ${beneType.value} is '+Number(totalShares)+' but it must equal exactly 100');
					verified = false;
				}
			</g:each>
			if (verified) {
			    $('#enrollmentForm').submit(); 
			}
	   });
	  
	   function showHideContactInfo() {
    	 if ($('#noContactInfoChanges').is(':checked')) {
    	 	$('#contactInfo').hide();
    	 } else {
    	 	$('#contactInfo').show();
    	 }
	   }
	   showHideContactInfo();
	   $('#noContactInfoChanges').click(function() {
	    	showHideContactInfo();
	   });
	   var beneficiaryPriRowNo = ${Beneficiary.findAllByIdAndType(enroll.id, 'P')?.size()?:0};
	   $('.promptNewPriBeneficiary').click(function () {
	   		var link = $(this);
	   		var beneType = $(this).attr('beneType');
	   		var rowNo = $('form', link.parent()).length+1;
	   		if (window.console) console.log('new rowNo'+rowNo);
	        $.ajax({
	           url: "${createLink(action:'promptNewBeneficiary')}",
	           data: { id: ${enroll?.id}, beneficiaryRowNo: rowNo, type: beneType},
	           type: 'POST',
	           success:function(data) {link.before(data);},
	           error: function(xhr, textStatus, errorThrown) { alert(textStatus); }
	        });
	   }); 
	   
    	$('#sameAsPrimary').click(function () {
	        $.ajax({
	           url: "${createLink(action:'beneSameAsPrimary')}",
	           data: { id: ${enroll?.id}, sameAsPrimary: $(this).is(':checked')},
	           type: 'POST',
	           success:function(data) {if(window.console)consol.log(data);},
	           error: function(xhr, textStatus, errorThrown) { alert(textStatus); }
	        });
	   });
    
	   enrollConfirmToUpdateSubmitText();
    </g:javascript>
</body>
</html>
