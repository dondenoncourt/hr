
<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
     <meta name="layout" content="enrollTab" />
        <r:require module="common"/>
     <link href="${createLinkTo(dir: 'css', file: 'enrollment.css')}" rel="stylesheet" type="text/css"/>
     <title>Health Plan Edit</title>
</head>
<body>
    <div class="enrollContent">
		<g:render template="healthPlanEdit" model="[enroll:enroll]" />
		<div class="clear"></div>
		<div class="nextBtn">
	        <g:hiddenField name="view" value="healthPlanEdit" /><!-- here just for tab coloring -->
			<a href="${createLink(action:'confirmHealthPlan',id:enroll?.id)}"
				id="pageUpdateButton" 
				title="Click to update Health Plan information and continue to next tab">
				Confirm and Next
			</a>
		</div>
	</div>
<g:javascript>
	$('#pageUpdateButton').click(function () {
		if ($('#coveredTable0') == undefined) {
			alert('Please assign at least one covered individual');
			return false;
		}
		$('form').each(function() {
			if (this.changed != null && this.changed.value == 'true') {
				$('input.save', this).trigger("click");
			}
		});
		return true;
	});
    $('#importantInfoOpen').click(function () {
    	 $('#importantInfo').show();
    });
    $('#importantInfoClose').click(function () {
    	 $('#importantInfo').hide();
    });
  
   	var coveredRowNo = ${enroll?.covered?.size()?:0};
    $('#promptNewCovered').click(function () {
        $.ajax({
           url: "${createLink(action:'promptNewCovered')}",
           data: { id: ${enroll?.id}, coveredRowNo: coveredRowNo },
           type: 'POST',
           success:function(data) {
           			//alert('#coveredEditDiv'+coveredRowNo);
           			$('#promptNewCovered').before(data);
           			coveredRowNo += 1;
					// $('#birth').datepicker({dateFormat: 'mm/dd/yy'}) //for jquery date picker
           		},
           error: function(xhr, textStatus, errorThrown) { alert(textStatus); }
        });
    });
   	var otherCoverageRowNo = ${enroll?.otherCoverages?.size()?:0};
    $('#promptNewOtherCoverage').click(function () {
        $.ajax({
           url: "${createLink(action:'promptNewOtherCoverage')}",
           data: { id: ${enroll?.id}, otherCoverageRowNo: otherCoverageRowNo },
           type: 'POST',
           success:function(data) {
           			$('#promptNewOtherCoverage').before(data);
           			otherCoverageRowNo += 1;
           		},
           error: function(xhr, textStatus, errorThrown) { alert(textStatus); }
        });
    });
   	var medicareRowNo = ${enroll?.medicareCoverages?.size()?:0};
    $('#promptNewMedicare').click(function () {
        $.ajax({
           url: "${createLink(action:'promptNewMedicare')}",
           data: { id: ${enroll?.id}, medicareRowNo: medicareRowNo },
           type: 'POST',
           success:function(data) {
           			$('#promptNewMedicare').before(data);
           			medicareRowNo += 1;
           		},
           error: function(xhr, textStatus, errorThrown) { alert(textStatus); }
        });
    });
    function waivedClicked() {
    	if ($('#waive').is(":checked")) {
    		$('#coveredFieldSet').hide();
    	} else {
    		$('#coveredFieldSet').show();
    	}
	}    
	waivedClicked()
    $('#waive').click(function () {
		waivedClicked()
    });
    $('div.message').width('80%');
    
    enrollConfirmToUpdateSubmitText();
</g:javascript>
</body>
</html>
