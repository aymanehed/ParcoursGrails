<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'POI.label', default: 'POI')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <asset:stylesheet src="IndexPOI.css"/>
</head>

<body>
<a href="#list-POI" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                          default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-POI" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div class="cards">
        <g:each in="${POIList}" var="POI">
            <div class="card">
                <h2>${fieldValue(bean: POI, field: "name")}</h2>
                <p>${fieldValue(bean: POI, field: "description")}</p>
                <p>Latitude: ${fieldValue(bean: POI, field: "latitude")}</p>
                <p>Longitude: ${fieldValue(bean: POI, field: "longitude")}</p>
                <p>Parcours: <g:link controller="parcours" action="show" id="${POI?.parcours?.id}">${fieldValue(bean: POI, field: "parcours.name")}</g:link></p>
                <ul class="image-list">
                    <g:each in="${POI.illustrationList}" var="illustration">
                        <li class="image-item">
                            <g:link controller="illustration" action="show" id="${illustration.id}">
                                <img src="${grailsApplication.config.illustrations.url + illustration.name}"/>
                            </g:link>
                        </li>
                    </g:each>
                </ul>
            </div>
        </g:each>
    </div>
    <div class="pagination">
        <g:paginate total="${POICount ?: 0}"/>
    </div>
</div>
</body>
</html>
