<%@ page import="daffron.fms.hr.safety.Incident" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <r:require module="common"/>
        <link rel="stylesheet" href="${resource(dir:'css',file:'recruitment.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'buttons.css')}" />
        <title>incident list</title>
        <g:render template="/javascript/safety" />
    </head>
    <body>
        <g:render template="search" model="[incidentList:incidentList, params:params]"/>
        <br />
        <div class="buttons linkBtns">
            <g:link class="add button" action="create">New Incident</g:link>
            <g:link class="list button" action="list">List Incidents</g:link>
        </div>
        <div class="clear"></div>
        <g:render template="list" model="[incidentList:incidentList]"/>
        <daffron:jasperReport jasper="provare" format="PDF" name="First Jasper Attempt"> </daffron:jasperReport>
        <daffron:jasperReport jasper="osha300" format="PDF" name="OSHA 300 Report"> </daffron:jasperReport>
    </body>
</html>
