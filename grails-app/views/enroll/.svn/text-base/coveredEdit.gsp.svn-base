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
        <div>
			<table id="coveredTable">
				<thead>
					<tr>
						<th>Relationship</th>
						<th>Sex</th>
						<th>Birth Date</th>
						<th>Name</th>
						<th>Soc Sec#</th>
						<th>Action</th>
					</tr>
				</thead>
			</table>
			<g:each in="${enroll?.covered?}" var="covered" status="coveredRowNo">
				<g:render template="coveredEdit" model="[enroll:enroll, covered:covered, coveredRowNo:coveredRowNo]" />
			</g:each>	
			<a href="#" id="promptNewCovered" class="add">Add Covered</a>				
		</div>
				
		<g:javascript>
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
	    </g:javascript>
    </body>
</html>
