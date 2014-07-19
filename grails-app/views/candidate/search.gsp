<%@ page import="daffron.fms.hr.recruiting.Candidate" %>
<%@ page import="daffron.fms.hr.recruiting.RequisitionCandidate" %>
<%@ page import="daffron.fms.hr.recruiting.DriverExperience" %>
<%@ page import="daffron.fms.hr.recruiting.YesNo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="recruiting" />
        <g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
	    <r:require module="common"/>
		<link rel="stylesheet" type="text/css" href="${resource(dir:'css',file:'jquery.contextMenu.css')}" />
		<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/base/jquery-ui.css" type="text/css" media="all" />	
		<g:javascript library="jquery-ui" plugin="jquery-ui"/>
    </head>
    <body>
	    <h1>Applicant Search</h1>
	    <div id="searchPanel">
        <g:form action="search">
            <div class="rtl">
				<dl class="rtl">
					<dt>Name </dt>
					<dd><g:textField name="name" value="${params?.name}" /></dd>
                </dl>
				<dl class="rtl">
					<dt>Military</dt>
					<dd><g:checkBox name="military" value="${params?.military}" /></dd>
                </dl>
				<dl class="rtl">
					<dt>College</dt>
					<dd><g:checkBox name="collegeEdu" value="${params?.collegeEdu}" /></dd>
                </dl>
				<dl class="rtl">
					<dt>Driver Experience</dt>
					<dd>
					   <select name="driverExpClass">
				          <option value="">--pick one--</option>
					      <g:each in="${DriverExperience.CLASS_MAP}" var="klass">
					        <option value="${klass.key}"
					            ${params.driverExpClass == klass.key?'selected=selected':''} >
					            ${klass.value}
						    </option>
						  </g:each>
					  </select>
					</dd>
                </dl>
				<dl class="rtl">
					<dt>Question</dt>
					<dd>
					   <select name="yesNo" multiple="multiple" size="5" width="20" >
  				          <option value="">-- pick one or more --</option>
					      <g:each in="${YesNo.list()}" var="yesNo">
	  				          <g:set var="selected" value="${params.yesNo?.find{it as Long == yesNo.id}}"/>
					          <option style="width: 815px;" value="${yesNo.id}"
					           <% if (selected) { %>selected=selected<% } %>
					           >
					            ${yesNo.question}${selected}
						      </option>
						  </g:each>
					  </select>
					</dd>
				</dl>
				<dl class="rtl">
					<dt>Degree</dt>
					<dd><g:textField name="degree" value="${params.degree}"/></dd>
				</dl>
			</div>
			<div class="clear"></div>
			<div class="buttons">
			    <g:submitButton class="search button" action="search" name="list" value="Search" title="search"/>
			    <g:link class="back button" action="list" controller="requisition" title="Requisition List">Back</g:link>
	        </div>
            <br /><br />
           </g:form>
           </div>
           <div class="clear"></div>
	       
	     <g:if test="${flash.message}">
	     <div class="message">${flash.message}</div>
	     </g:if>
	     <div class="list candiList">
	         <table class="recruitment">
	             <thead>
	                 <tr>
	                     <g:sortableColumn property="name" title="${message(code: 'candidate.name.label', default: 'Name')}" params="${params}"/>
	                     <g:sortableColumn property="totalYearsEdu" title="Years Edu" params="${params}"/>
	                     <g:sortableColumn property="military.branch" title="Military" params="${params}"/> 
	                     <g:sortableColumn property="skills" title="Skills" params="${params}"/> 
	                     <g:sortableColumn property="requisition" title="Req No" params="${params}"/> 
	                 </tr>
	             </thead>
	             <tbody>
	             <g:each in="${candidateList}" status="i" var="candidate">
	                 <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" class="candiRow" id="${candidate.id}">
	                     <td><g:link action="show" id="${candidate.id}">${fieldValue(bean: candidate, field: "name")}</g:link></td>
	                     <td>${candidate.totalYearsEdu}</td>
	                     <td>${candidate.military?.branch}${candidate.military?':':''}${candidate.military?.years} ${candidate.military?' yrs':''}</td>
	                     <td>${candidate.skills}</td>
	                     <td id="candidate${candidate.id}">
	                           <g:each in="${RequisitionCandidate.findAllByCandidate(candidate)}" var="reqCandi">
			                       <g:link controller="requisition" action="show"  id="${reqCandi.requisition.id}" title="Click to view requisition detail">${reqCandi.requisition.id}</g:link>
			                       &nbsp;
			                   </g:each>
	                     </td>
	                 </tr>
	             </g:each>
	             </tbody>
	         </table>
	     </div>
	     <div class="paginateButtons">
	         <g:paginate total="${candidateList.totalCount}" params="${params}"/>
	     </div>
	     <ul id="candiMenu" class="contextMenu" >
            <li><a href="#edit">Edit</a></li>
            <li><a href="#">Assign to Req</a></li>
         </ul>
         
		<div id="selectReq" title="Select Requisition">
		    <p>This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
		</div>
	
    <g:javascript>
        $("#selectReq").dialog({ autoOpen: false });
        $(".candiList tr").contextMenu({
	            menu: 'candiMenu'
	        },
	        function(action, el, pos) {
	           if (action == 'edit') {
				    window.location.href = "${createLink(action:'show',controller:'candidate')}/"+$(el).attr('id');            
			   } else {
				    $.ajax({
			            url: "${createLink(controller:'requisition',action:'openReqs')}", 
			            data: "id="+$(el).attr('id'),
			            type: "POST",
			            success: function(data) { 
			                 $('#selectReq').html(data); 
							 $( "#selectReq" ).dialog('open');
			            },
			            error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
			         });
			   }
            }
        );
                
    
    </g:javascript>
	<script type='text/javascript' src='${resource(dir:'js',file:'jquery.contextMenu.js')}'></script>
    </body>
</html>
