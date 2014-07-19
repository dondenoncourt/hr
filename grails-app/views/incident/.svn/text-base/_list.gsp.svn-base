<%@ page import="daffron.fms.hr.safety.Incident" %>
<h1>Incident List</h1>
<g:if test="${flash.message}">
<div class="message">${flash.message}</div>
</g:if>
<table class="recruitment">
    <thead>
        <tr>
            <g:sortableColumn property="id" title="${message(code: 'incident.id.label', default: 'Id')}" />
            <g:sortableColumn property="employee" title="${message(code:'incident.employee.label', default:'employee')}" />
            <g:sortableColumn property="incidentDate" title="${message(code:'incident.incidentDate.label', default:'incidentDate')}" />
            <th>Injury Details</th>
            <th>Medical Care Details</th>
            <th>Transport Details</th>
            <th>Days Away / Restriction Details</th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${incidentList}" status="i" var="incident">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td><g:link action="show" id="${incident.id}" title="Click to display incident detail on ${incident.employee?.name}">
                    ${incident.id}
                </g:link></td>
            <td>${incident.employee?.name}</td>
            <td><g:formatDate date="${incident.incidentDate}" format="MM-dd-yy"/></td>
            <td>Not Performing Usual Job: ${incident.notUsualJob}<br />
                Desc: ${incident.injury}<br />
                Emp Desc: ${incident.empDescInjury}<br />
                Source: ${Incident.SOURCE_TYPES[incident.injurySource]}<br />
                Cause: ${incident.injuryCause}
            </td>
            <td>Medical Care Required: <% if (incident.medCareRequired) { %><img src="${resource(dir:'images',file:'checkmark.gif')}"/><% } %><br />
                Medical Care On Scene: <% if (incident.medCareOnScene) { %><img src="${resource(dir:'images',file:'checkmark.gif')}"/><% } %><br />
                More Med Care Required:<% if (incident.medCareMoreRequired) { %><img src="${resource(dir:'images',file:'checkmark.gif')}"/><% } %><br /> 
                Fatality Date: <g:formatDate date="${incident.death}" format="MM-dd-yy"/><br />
                Hospitalized: <% if (incident.hospitalized) { %><img src="${resource(dir:'images',file:'checkmark.gif')}"/><% } %><br />
                Medical Care at Clinic: <% if (incident.careAtClinic) { %><img src="${resource(dir:'images',file:'checkmark.gif')}"/><% } %><br />
                Outpatient: <% if (incident.careOutpatient) { %><img src="${resource(dir:'images',file:'checkmark.gif')}"/><% } %><br />
                First Aid: <% if (incident.careFirstAid) { %><img src="${resource(dir:'images',file:'checkmark.gif')}"/><% } %><br />
                Emergency Room: <% if (incident.careEmergencyRoom) { %><img src="${resource(dir:'images',file:'checkmark.gif')}"/><% } %><br />
            </td>
            <td>Type: ${incident.transToCareType}<br />
                To Medical: <g:formatDate date="${incident.transToCare}" format="MM-dd-yy"/><br />
                From Medical: <g:formatDate date="${incident.transFromCare}" format="MM-dd-yy"/>
            </td>
            <td>Last Date Worked: <g:formatDate date="${incident.lastWorked}" format="MM-dd-yy"/><br />
                First Away Date: <g:formatDate date="${incident.firstAway}" format="MM-dd-yy"/><br />
                Last Away Date: <g:formatDate date="${incident.lastAway}" format="MM-dd-yy"/><br />
                Return Work Date: <g:formatDate date="${incident.returnWork}" format="MM-dd-yy"/><br />
                Disability Start Date: <g:formatDate date="${incident.disabilityStart}" format="MM-dd-yy"/><br />
                Restricted Days: ${incident.restrictedDays}     
            </td>
        </tr>
        </g:each>
    </tbody>
</table>
<div class="paginateButtons">
    <g:paginate total="${incidentTotal}" />
</div>
