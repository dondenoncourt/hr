<%@ page import="daffron.fms.hr.safety.Incident" %>
<%@ page import="daffron.fms.hr.safety.InjuryDetail" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <r:require module="common"/>
        <link href="${createLinkTo(dir: 'css', file: 'recruitment.css')}" rel="stylesheet" type="text/css"/>
        <link href="${createLinkTo(dir: 'css', file: 'buttons.css')}" rel="stylesheet" type="text/css"/>
        <title>${action} Incident</title>
        <link href="${createLinkTo(dir: 'css', file: 'readOnly.css')}" rel="stylesheet" type="text/css"/>
        <g:render template="/javascript/safety" />
    </head>
    <body>
        <div class="buttons linkBtns">
            <g:link class="add button" action="create">New Incident</g:link>
            <g:link class="list button" action="list">List Incidents</g:link>
        </div>
        <div class="clear"></div>
        <g:if test="${flash.message}"
        <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${jobD}">
        <div class="errors">
            <g:renderErrors bean="${jobD}" as="list" />
        </div>
        </g:hasErrors>
        <g:render template="edit" model="[incident:incident]"/>
    <g:javascript>
        if ($('title').html().toLowerCase().indexOf('create') > -1) {
            $('.contextMenu li a.create').parent().addClass('current');
        }
    </g:javascript>
    </body>
</html>
