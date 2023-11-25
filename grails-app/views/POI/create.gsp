<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'POI.label', default: 'POI')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <asset:stylesheet src="createPoi.css"/>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

    <asset:javascript src="poimap.js"/>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
    <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a>
        <g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_USER')}">
            <li><g:link class="home" controller="profile" action="MesPois">MesPOI</g:link></li>
        </g:if>
        <g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_ADMIN')}">
            <li><g:link class="home" controller="POI" action="index">ListPOI</g:link></li>
        </g:if>
        <li> <g:link controller="logout" action="index"> <asset:image src="logout.png" width="18px"/> Logout</g:link> </li>
    </ul>
</div>

<div class="form-container">
    <h1>Créer un nouveau POI</h1>
    <g:form controller="POI" action="save" method="POST" enctype="multipart/form-data">
        <label for="name">Name:</label>
        <g:textField name="name" required="true"/>

        <label for="description">Description:</label>
        <g:textArea name="description" required="true" rows="4"/>

        <label for="latitude" hidden="">Latitude:</label>
        <g:textField id="lat"  hidden="" name="latitude" required="true" type="number" step="any"/>

        <label for="longitude" hidden="">Longitude:</label>
        <g:textField  hidden="" id="lng" name="longitude" required="true" type="number" step="any"/>

        <label for="parcours">Parcours:</label>
        <g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_USER')}">
        <g:select name="parcours.id" from="${parcoursListUser}" optionKey="id" optionValue="name"
                  required="true"/> </g:if>
        <g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_ADMIN')}">
            <g:select name="parcours.id" from="${parcoursListAdmin}" optionKey="id" optionValue="name"
                      required="true"/>
        </g:if>
        <div id="map" class="form-input-inline" style="width: 100%; height: 300px;"></div>
        <g:submitButton name="Create POI" controller="POI" action="create"/>

    </g:form>
</div>


</body>
</html>
