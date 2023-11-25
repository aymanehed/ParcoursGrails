<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'POI.label', default: 'POI')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <asset:stylesheet src="ShowPoi.css"/>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

</head>

<body>
<a href="#show-POI" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                          default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
        <li><g:link controller="logout" action="index"><asset:image src="logout.png" width="18px"/> Logout</g:link></li>
    </ul>
</div>

<div id="show-POI" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list POI">

        <li class="fieldcontain">
            <span id="name-label" class="property-label">Name</span>
            <div class="property-value" aria-labelledby="name-label">${POI.name}</div>
        </li>

        <li class="fieldcontain">
            <span id="description-label" class="property-label">Description</span>
            <div class="property-value" aria-labelledby="description-label">${POI.description}</div>
        </li>

        <li class="fieldcontain">
            <span id="parcours-label" class="property-label">Parcours</span>

            <div class="property-value" aria-labelledby="parcours-label">
                <g:link controller="parcours" action="show" id="${POI.parcours.id}">${POI.parcours.name}</g:link>
            </div>
        </li>

        <li class="fieldcontain">
            <ul class="image-list">
                <g:each in="${POI.illustrationList}" var="illustration">
                    <li class="image-item">
                        <g:link controller="illustration" action="show" id="${illustration.id}">
                            <img src="${grailsApplication.config.illustrations.url + illustration.name}" alt="${illustration.name}"/>
                        </g:link>
                    </li>
                </g:each>
            </ul>
        </li>

    </ol>
    <div id="map" class="form-input-inline" style="width: 100%; height: 300px;"></div>
    <g:form resource="${this.POI}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.POI}"><g:message code="default.button.edit.label"
                                                                                 default="Edit"/></g:link>
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
<script>
    function initMap() {
        const myLatLng = {lat: ${POI.latitude}, lng: ${POI.longitude}};
        const map = new google.maps.Map(document.getElementById("map"), {
            zoom: 12,
            center: { lat: ${POI.latitude}, lng: ${POI.longitude} }
        });
        new google.maps.Marker({
            position: myLatLng,
            map,
            title: "${POI.name}",
        });
    }
</script>
</body>
</html>
