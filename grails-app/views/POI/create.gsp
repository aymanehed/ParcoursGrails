<%@ page import="com.mbds.parcours.Parcours" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'POI.label', default: 'POI')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <asset:stylesheet src="createPoi.css"/>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAP18kvzxfaxA3_LHZlN_kKdc8u0qmcaE0&callback=initMap"
            async defer></script>
    <asset:javascript src="poimap.js"/>
</head>

<body>
<div class="form-container">
    <div class="nav" role="navigation">
        <ul>

            <g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_USER')}">
                <li><g:link class="home" controller="profile" action="MesPois">MesPOI</g:link></li>
            </g:if>
            <g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_ADMIN')}">
                <li><g:link class="home" controller="POI" action="index">ListPOI</g:link></li>
            </g:if>
        </ul></div>

    <h1>Créer un nouveau POI</h1>
    <g:form controller="POI" action="save" method="POST" enctype="multipart/form-data">
        <label for="name">Name:</label>
        <g:textField name="name" required="true"/>

        <label for="description">Description:</label>
        <g:textArea name="description" required="true" rows="4"/>

        <label for="latitude">Latitude:</label>
        <g:textField id="lat" name="latitude" required="true" type="number" step="any"/>

        <label for="longitude">Longitude:</label>
        <g:textField id="lng" name="longitude" required="true" type="number" step="any"/>

        <label for="parcours">Parcours:</label>
        <g:select name="parcours.id" from="${Parcours.list()}" optionKey="id" optionValue="name"
                  required="true"/>

        <g:submitButton name="Create POI"/>
    </g:form>

    <g:link controller="parcours" action="show" id="${poiInstance?.parcours?.id}">Back to Parcours</g:link>

    <div id="map" class="form-input-inline" style="width: 100%; height: 300px;"></div>
<button class="form-button" type="submit">Submit</button>
</body>
</html>
