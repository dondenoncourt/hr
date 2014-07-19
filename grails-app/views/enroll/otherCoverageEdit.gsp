
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="enrollTab" />
        <r:require module="common"/>
        <link href="${createLinkTo(dir: 'css', file: 'enrollment.css')}" rel="stylesheet" type="text/css"/>
        <title>Other Coverage Edit</title>
    </head>
    <body>
        
        <div>

				<table id="otherCoverageTable">
					<thead><tr><th>Name</th><th>Carrier</th><th>Policy No</th><th>Action</th></tr></thead>
				</table>
				<g:each in="${enroll?.otherCoverages?}" var="otherCoverage" status="otherCoverageRowNo">
					<g:render template="otherCoverageEdit" model="[enroll:enroll, otherCoverage:otherCoverage, otherCoverageRowNo:otherCoverageRowNo]" />
				</g:each>	
				<a href="#" id="promptNewOtherCoverage" class="add">Add Other Coverage</a> 
				
		</div>
				
	<g:javascript>
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
    enrollConfirmToUpdateSubmitText();
    </g:javascript>
</body>
</html>
