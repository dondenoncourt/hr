<%@ page import="daffron.fms.hr.safety.Incident" %>
<h1>
    <g:if test="${action=='create'}">
        Create  
    </g:if>
    <g:elseif test="${action=='show'}">
        Display
    </g:elseif>
    <g:elseif test="${action=='edit'}">
        Edit
    </g:elseif>
    Incident
</h1>
<div class="clear"></div>
<g:if test="${flash.message}">
    <div class="general msg">${flash.message}</div>
</g:if>
<g:hasErrors bean="${incident}">
	<div class="errors msg">
	    <g:renderErrors bean="${incident}" as="list" />
	</div>
</g:hasErrors>
<g:form action="save" name="incidentForm">
    <g:hiddenField name="id" value="${incident?.id}"/>
    <div class="dialog iXpStd">
    <fieldset class="rtl">
        <legend>Incident Details</legend>
	      <dl>
	          <dt class="name">Employee Name </dt>
	          <dd class="value ${hasErrors(bean: incident, field: 'employee', 'errors')}">
	              <g:hiddenField name="employee.id" id="employee_id" value="${incident?.employee?.id?:0}"/>
	              <g:textField name="employeeName" value="${incident?.employee?.name}" />
	          </dd>
	      </dl>
	      <dl>
	          <dt class="name">
	              <g:message code="incident.injury.label" default="Injury" />
	          </dt>
	          <dd class="value ${hasErrors(bean: incident, field: 'injury', 'errors')}">
	              <g:textField name="injury" value="${incident?.injury}" />
	          </dd>
          </dl>
          <dl>
	          <dt class="name">
	              <g:message code="incident.incidentDate.label" default="Incident Date" />
	          </dt>
	          <dd class="value ${hasErrors(bean: incident, field: 'incidentDate', 'errors')}">
	              <daffron:jqDatePicker name="incidentDate" class="date " 
	                        value="${incident?.incidentDate?g.formatDate(format:'MM/dd/yyyy', date:incident?.incidentDate):''}" />
	          </dd>
	      </dl>
    	  <dl>
              <dt class="name"><g:message code="incident.notUsualJob.label" default="Not Usual Job" /> </dt>
              <dd>
                  <g:checkBox name="notUsualJobBoolean" value="${incident?.notUsualJob?.id?true:false}" />
                  <g:select name="notUsualJob.id" id="notUsualJob_Id" from="${daffron.fms.hr.recruiting.JobClassDescription.list()}" optionKey="id" 
                      value="${incident?.notUsualJob?.id}" noSelection="['null': '']" />
              </dd>
    	  </dl>	  
          <dl>
              <dt class="name">
                  <g:message code="incident.hospitalized.label" default="Hospitalized" />
              </dt>
              <dd class="value ${hasErrors(bean: incident, field: 'hospitalized', 'errors')}">
                  <g:checkBox name="hospitalized" value="${incident?.hospitalized}" />
              </dd>
          </dl>   
	      <dl>
	          <dt class="name">
	              <g:message code="incident.empDescInjury.label" default="Emp Desc Injury" />
	          </dt>
	          <dd class="value ${hasErrors(bean: incident, field: 'empDescInjury', 'errors')}">
	              <g:textField name="empDescInjury" value="${incident?.empDescInjury}" />
	          </dd>
	      </dl>	  
	      <dl>
	          <dt class="name">
	              <g:message code="incident.injurySource.label" default="Injury Source" />
	          </dt>
	          <dd class="value ${hasErrors(bean: incident, field: 'injurySource', 'errors')}">
					<select name="injurySource" >
						<option value="">--source--</option>
						<g:each in="${Incident.SOURCE_TYPES}" var="type">
							<option value="${type.key}" ${((incident?.injurySource==type.key)?'selected=\"selected\"':'')}>${type.value}</option>
						</g:each>
					</select>
	          </dd>
          </dl>
          <dl>
	          <dt class="name">
	              <g:message code="incident.injuryCause.label" default="Injury Cause" />
	          </dt>
	          <dd class="value ${hasErrors(bean: incident, field: 'injuryCause', 'errors')}">
	              <g:textField name="injuryCause" value="${incident?.injuryCause}" />
	          </dd>
	      </dl>      
	      <dl>
	          <dt class="name">
	              <g:message code="incident.doctor.label" default="Doctor" />
	          </dt>
	          <dd class="value ${hasErrors(bean: incident, field: 'doctor', 'errors')}">
	              <g:hiddenField name="doctor.id" id="doctor_id" value="${incident?.doctor?.id}"/>
	              <g:textField name="doctorName" value="${incident?.doctor?.name}" />
	             <a class="add button" onclick="window.open('${request.contextPath}/doctor/create')">Add</a>
	          </dd>
	          <dt class="name">
	              <g:message code="incident.hospital.label" default="Hospital" />
	          </dt>
	          <dd class="value ${hasErrors(bean: incident, field: 'hospital', 'errors')}">
	              <g:textField name="hospital" value="${incident?.hospital}" />
              </dd>
          </dl>
        </fieldset>
    
		<fieldset class="workDays rtl">
		 <legend>Days Away</legend>
             <dl>
                 <dt class="name">
                     <g:message code="incident.lastWorked.label" default="Last Worked" />
	           </dt>
	           <dd class="value ${hasErrors(bean: incident, field: 'lastWorked', 'errors')}">
	               <daffron:jqDatePicker name="lastWorked" class="date" value="${incident?.lastWorked?g.formatDate(format:'MM/dd/yyyy', date:incident?.lastWorked):''}"  />
	           </dd>
	       </dl>
   
	       <dl>
	           <dt class="name">
	               <g:message code="incident.firstAway.label" default="First Away" />
	           </dt>
	           <dd class="value ${hasErrors(bean: incident, field: 'firstAway', 'errors')}">
	               <daffron:jqDatePicker name="firstAway" class="date" value="${incident?.firstAway?g.formatDate(format:'MM/dd/yyyy', date:incident?.firstAway):''}"  />
	           </dd>
	           
	           <dt class="name">
	               <g:message code="incident.lastAway.label" default="Last Away" />
	           </dt>
	           <dd class="value ${hasErrors(bean: incident, field: 'lastAway', 'errors')}">
	               <daffron:jqDatePicker name="lastAway" class="date" value="${incident?.lastAway?g.formatDate(format:'MM/dd/yyyy', date:incident?.lastAway):''}"  />
	           </dd>
	       </dl>
	   
	       <dl>
	           <dt class="name">
	               <g:message code="incident.returnWork.label" default="Return Work" />
	           </dt>
	           <dd class="value ${hasErrors(bean: incident, field: 'returnWork', 'errors')}">
	               <daffron:jqDatePicker name="returnWork" class="date" value="${incident?.returnWork?g.formatDate(format:'MM/dd/yyyy', date:incident?.returnWork):''}"  />
	           </dd>
	       </dl>
	   
	       <dl>
	           <dt class="name">
	               <g:message code="incident.disabilityStart.label" default="Disability Start" />
	           </dt>
	           <dd class="value ${hasErrors(bean: incident, field: 'disabilityStart', 'errors')}">
	               <daffron:jqDatePicker name="disabilityStart" class="date" value="${incident?.disabilityStart?g.formatDate(format:'MM/dd/yyyy', date:incident?.disabilityStart):''}"  />
	           </dd>
	           <dt class="name">
	               <g:message code="incident.restrictedDays.label" default="Restricted Days" />
	           </dt>
	           <dd class="value ${hasErrors(bean: incident, field: 'restrictedDays', 'errors')}">
	               <g:textField name="restrictedDays" value="${fieldValue(bean: incident, field: 'restrictedDays')}" />
	                 </dd>
	             </dl>
         </fieldset>
		<fieldset class="treatment rtl">
   		 <legend>Treatment</legend>           
           <dl>
               <dt class="name">
                   <g:message code="incident.medCareRequired.label" default="Med Care Required" />
               </dt>
               <dd class="value ${hasErrors(bean: incident, field: 'medCareRequired', 'errors')}">
                   <g:checkBox name="medCareRequired" value="${incident?.medCareRequired}" />
               </dd>
           </dl>
           <dl>
	           <dt class="name">
	               <g:message code="incident.medCareOnScene.label" default="Med Care On Scene" />
	           </dt>
	           <dd class="value ${hasErrors(bean: incident, field: 'medCareOnScene', 'errors')}">
	               <g:checkBox name="medCareOnScene" value="${incident?.medCareOnScene}" />
	           </dd>
           </dl>
           <dl>
               <dt class="name">
                   <g:message code="incident.medCareMoreRequired.label" default="Med Care More Required" />
               </dt>
               <dd class="value ${hasErrors(bean: incident, field: 'medCareMoreRequired', 'errors')}">
                   <g:checkBox name="medCareMoreRequired" value="${incident?.medCareMoreRequired}" />
               </dd>
           </dl>
           <dl>
	  			<dt> Fatality Date</dt>	
	  			<dd class="value ${hasErrors(bean: incident, field: 'death', 'errors')}">
	                <daffron:jqDatePicker name="death" class="date" value="${incident?.death?g.formatDate(format:'MM/dd/yyyy', date:incident?.death):''}"  /> 
                </dd>
             </dl>
        </fieldset>
     
		<fieldset class="transport rtl">
		<legend>Transportation to Medical Facility</legend>
            <dl>                
                <dt class="name">
                    <g:message code="incident.transToCare.label" default="Trans To Care" />
                </dt>
	            <dd class="value ${hasErrors(bean: incident, field: 'transToCare', 'errors')}">
	                <daffron:jqDatePicker name="transToCare" class="date" value="${incident?.transToCare?g.formatDate(format:'MM/dd/yyyy', date:incident?.transToCare):''}"  />
	            </dd>
            </dl>          
           <dl>
               <dt class="name">
                   <g:message code="incident.careFirstAid.label" default="Care First Aid" />
               </dt>
               <dd class="value ${hasErrors(bean: incident, field: 'careFirstAid', 'errors')}">
                   <g:checkBox name="careFirstAid" value="${incident?.careFirstAid}" />
               </dd>
           </dl>     
            <dl>                   
                <dt class="name">
                    <g:message code="incident.careAtClinic.label" default="Care At Clinic" />
               </dt>
               <dd class="value ${hasErrors(bean: incident, field: 'careAtClinic', 'errors')}">
                    <g:checkBox name="careAtClinic" value="${incident?.careAtClinic}" />
               </dd>
           </dl>           
            <dl>
                <dt class="name">
                    <g:message code="incident.transFromCare.label" default="Trans From Care" />
                </dt>
                <dd class="value ${hasErrors(bean: incident, field: 'transFromCare', 'errors')}">
                    <daffron:jqDatePicker name="transFromCare" class="date" value="${incident?.transFromCare?g.formatDate(format:'MM/dd/yyyy', date:incident?.transFromCare):''}"  />
                </dd>
            </dl>  	 
           <dl>
	           <dt class="name">
	               <g:message code="incident.careEmergencyRoom.label" default="Care Emergency Room" />
	           </dt>
	           <dd class="value ${hasErrors(bean: incident, field: 'careEmergencyRoom', 'errors')}">
	               <g:checkBox name="careEmergencyRoom" value="${incident?.careEmergencyRoom}" />
	           </dd>
	       </dl>  
           <dl>
	           <dt class="name">
	               <g:message code="incident.careOutpatient.label" default="Care Outpatient" />
	           </dt>
	           <dd class="value ${hasErrors(bean: incident, field: 'careOutpatient', 'errors')}">
	               <g:checkBox name="careOutpatient" value="${incident?.careOutpatient}" />
               </dd>
             </dl>        
            <dl>
                <dt class="name">
                    <g:message code="incident.transToCareType.label" default="Trans To Care Type" />
                </dt>
                <dd class="value ${hasErrors(bean: incident, field: 'transToCareType', 'errors')}">
                    <g:textField name="transToCareType" value="${incident?.transToCareType}" />
                </dd>
            </dl>
        </fieldset>
        
		<fieldset class="injuryDetails">
			 <legend>Injury Details</legend>
			 <table id="injuries" class="candidate">
			     <thead>
			         <tr>
			             <th>Body Part</th>
			             <th>Body Side</th>
			             <th>Nature</th>
		             </tr>
	             </thead>
			     <tbody> 
					  <g:each var="dtl" in="${incident.injuryDetails}" status="iDtl" >
    					  <tr>
	       				     <!--  Note: if you change the columns here, be sure to change javascript add row  -->
					         <td><g:textField name="injuryDetails[${iDtl}].bodyPart" value="${dtl.bodyPart}" /> </td>
					         <td><g:textField name="injuryDetails[${iDtl}].bodySide" value="${dtl.bodySide}" /> </td>
					         <td><g:textField name="injuryDetails[${iDtl}].nature" value="${dtl.nature}" /> </td>
			              </tr>
			          </g:each>
			  </tbody>
	      </table>
          <g:if test="${action!='show'}">
			 <a class="add button" id="addInjuryDesc" class="button">Add</a>
		  </g:if>
        </fieldset>
	    <div class="buttons">
	        <g:if test="${action=='show'}">
		         <g:actionSubmit class="edit button" action="edit" value="Edit" />
	        </g:if>
	        <g:elseif test="${action=='create'}">
		         <g:actionSubmit class="save button" action="save" value="Create" />
	        </g:elseif>
	        <g:elseif test="${action=='edit'}">
		         <g:actionSubmit class="update button" action="update" value="Update" />
		         <g:actionSubmit class="delete button" action="delete" value="Delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
	        </g:elseif>
	    </div>
    </div>
</g:form>
        
<g:javascript>
    $('#addInjuryDesc').click(function() {
        var newRow = $('#injuries tr').length - 1; // consider header
        $.ajax({
            url: "${createLink(action:'addInjuryDetail')}", 
            data: "id="+$('#id').val(),
            type: "POST",
            success: function(data) { if (window.console) console.log('injury detail added');},
            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
        });
        $('#injuries').append(
            '<tr>'+
                 '<td><g:textField name="injuryDetails['+newRow+'].bodyPart" /> </td>'+
                 '<td><g:textField name="injuryDetails['+newRow+'].bodySide" /> </td>'+
                 '<td><g:textField name="injuryDetails['+newRow+'].nature" /> </td>'+
            '</tr>');
        //setReindexInputArray();
    });
    $('.date').datepicker();
    $('#notUsualJobBoolean').click(function() {
        showHideNotUsualJob();
    });
    function showHideNotUsualJob() {
        if (window.console) console.log('showHide');
        if ($('#notUsualJobBoolean').is(':checked')) {
            $('#notUsualJob_Id').show();
        } else {
            $('#notUsualJob_Id').hide();
        }
    }
    showHideNotUsualJob();
    $('#incidentForm').submit(function() {
      if (Number($('#employee_id').val()) < 1) {
          alert('Please enter a valid employee name');
          return false;
      }
      return true; 
    });
    <g:if test="${action == 'show'}">
      $('form input').attr('disabled', true);
      $('form .buttons input').attr('disabled', false);
      $('#id').attr('disabled', false); // so edit button passes ID
    </g:if>
	
	$("#employeeName").autocomplete({
	    source: getEmpNames, // in /javascript/safety.gsp
	    change: function(event, ui) { 
	        $.ajax({
	            url: "${createLink(controller:'employee', action:'empNoByName')}", 
	            data: "name="+$('#employeeName').val(),
	            type: "POST",
	            success: function(data) { $('#employee_id').val(data); },
	            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
	        });
	    }, 
	    minLength: 1
	});
	$("#doctorName").autocomplete({
	    source: getDocNames, // in /javascript/safety.gsp
	    change: function(event, ui) { 
	        $.ajax({
	            url: "${createLink(action:'docNoByName')}", 
	            data: "name="+$('#doctorName').val(),
	            type: "POST",
	            success: function(data) { $('#doctor_id').val(data); },
	            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
	        });
	    }, 
	    minLength: 1
	});
</g:javascript>