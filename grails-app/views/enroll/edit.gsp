<%@ page import="org.codehaus.groovy.grails.commons.ConfigurationHolder as CH" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="enrollTab" />
        <link href="${createLinkTo(dir: 'css', file: 'enrollment.css')}" rel="stylesheet" type="text/css"/>
        <r:require module="common"/>
        <g:set var="entityName" value="${message(code: 'enroll.label', default: 'Enroll')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <g:javascript library="jquery" plugin="jquery"/>
    </head>
    <body>
      <%--   <div class="nav">
            <span class="menuButton"><g:link class="create" action="logout" controller="login">Log out</g:link></span>
            <% if (session.user == 'admin') { %>
            	<span class="menuButton"><g:link class="list" action="list" controller="enroll">Enroll List</g:link></span>
            <% } %>
             <span class="menuButton"><g:link class="" action="covered" controller="enroll" id="${enroll.id}">Covered</g:link></span>
        </div>
      --%>  
        <div class="body">
            <h1><g:message code="enroll.edit.form.header.label" /></h1>
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${enroll}">
	            <div class="errors">
	                <g:renderErrors bean="${enroll}" as="list" />
	            </div>
            </g:hasErrors>
            <div>
            </div>
            <g:render template="payMasterInfo" model="[enroll:enroll]" />
            <g:form method="post" name="enrollmentForm" action="update">
                <g:hiddenField name="id" value="${enroll?.id}" />
                <g:hiddenField name="version" id="enrollId" value="${enroll?.version}" />
				<fieldset>
					<legend>Contact Information Changes</legend>
					<dl> 
						<dt>Check if NO changes:</dt> 
						<dd><g:checkBox name="contact.noChanges" id="noContactInfoChanges" checked="${enroll?.contact?.noChanges}"/></dd>
					</dl>
					<g:render template="contactInfo" model="[enroll:enroll]" />
				</fieldset>
				<fieldset>
					<legend>Medical, Prescription Drug, Dental and Vision Coverage</legend>
					<g:render template="medDrugDentalVision" model="[enroll:enroll]" />
				</fieldset>
				<fieldset>
					<legend>Sesion 125 Cafeteri Plan -- Flexible Spending Account (FSA)</legend>
						<div id="cafeteriaEditDiv">
							<g:render template="cafeteriaEdit" model="[cafeteria:enroll?.cafeteria]" />
						</div>
				</fieldset>
            </g:form>
			<div class="importantInfo">
			<%-- perhaps this is overkill now that the div shows as a poppu 
				Click <a href="#" id="importantInfoOpen">here</a> to see important information regarding coverage for adult dependents and removal of lifetime limits
			--%>
			</div>
			<fieldset id="coveredFieldSet">
				<legend>Covered Individuals</legend>
				<table id="coveredTable">
					<thead><tr><th>Relationship</th><th>Sex</th><th>Birth Date</th><th>Name</th><th>Soc Sec#</th><th>Action</th></tr></thead>
				</table>
				<g:each in="${enroll?.covered?}" var="covered" status="coveredRowNo">
					<g:render template="coveredEdit" model="[enroll:enroll, covered:covered, coveredRowNo:coveredRowNo]" />
				</g:each>	
				<a href="#" id="promptNewCovered" class="add">Add Covered</a>
			</fieldset>
			<fieldset id="otherCoveragesFieldSet">
				<legend>Other Coverages</legend>
				<table id="otherCoverageTable">
					<thead><tr><th>Name</th><th>Carrier</th><th>Policy No</th><th>Action</th></tr></thead>
				</table>
				<g:each in="${enroll?.otherCoverages?}" var="otherCoverage" status="otherCoverageRowNo">
					<g:render template="otherCoverageEdit" model="[enroll:enroll, otherCoverage:otherCoverage, otherCoverageRowNo:otherCoverageRowNo]" />
				</g:each>	
				<a href="#" id="promptNewOtherCoverage" class="add">Add Other Coverage</a> 
			</fieldset>
			<fieldset id="medicareFieldSet">
				<legend>Medicare</legend>
				<table id="medicareTable">
					<thead><tr><th>Name</th><th>Policy No</th><th>Effective</th><th>Type</th><th>Action</th></tr></thead>
				</table>
				<g:each in="${enroll?.medicareCoverages?}" var="medicare" status="medicareRowNo">
					<g:render template="medicareEdit" model="[enroll:enroll, medicare:medicare, medicareRowNo:medicareRowNo]" />
				</g:each>	
				<a href="#" id="promptNewMedicare" class="add">Add Medicare Coverage</a>
			</fieldset>
			<fieldset id="voluntaryInsuranceFieldSet">
				<legend>VoluntaryInsurance</legend>
					
					<g:render template="voluntaryInsurance" model="[enroll:enroll]" />
			</fieldset>
            <div class="buttons">
                <span class="button">
                	<a href="#" id="updateEnrollmentLink" class="save" title="Click to update enrollment information">
                		Update Enrollment
                	</a>
                </span>
            </div>
        </div>

        <div id="returnMessage">
        	${CH.config.hr.enrollment.form.return.request}
        </div>
        <div id="importantInfo">
        	${CH.config.hr.enrollment.form.important.info}
			<a href="#" id="importantInfoClose">Close</a> 
        </div>
<g:javascript>
    $('#updateEnrollmentLink').click(function(){
        $("#enrollmentForm").submit();
    });   

	<% if (session.user == 'admin') { %>
  		$('#importantInfo').hide();   
  	<% } %>
    $('#importantInfoOpen').click(function () {
    	 $('#importantInfo').show();
    });
    $('#importantInfoClose').click(function () {
    	 $('#importantInfo').hide();
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
    		$('#otherCoveragesFieldSet').hide();
    		$('#medicareFieldSet').hide();
    		$('#voluntaryInsuranceFieldSet').hide();
    	} else {
    		$('#coveredFieldSet').show();
    		$('#otherCoveragesFieldSet').show();
    		$('#medicareFieldSet').show();
    		$('#voluntaryInsuranceFieldSet').show();
    	}
	}    
	waivedClicked()
    $('#waive').click(function () {
		waivedClicked()
    });
    $('div.message').width('80%');
</g:javascript>
    </body>
</html>
