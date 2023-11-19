<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'POI.label', default: 'POI')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <asset:stylesheet src="IndexPOI.css"/>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" controller="POI" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        <li> <g:link controller="logout" action="index"> <asset:image src="logout.png" width="18px"/> Logout</g:link> </li>
    </ul>
</div>
    <div id="list-POI" class="content scaffold-list" role="main">
        <h1><g:message code="default.list.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

<div class="cards">
<g:each in="${parcours}" var="parcoursItem">
    <g:each in="${parcoursItem.poiList}" var="poiItem">
        <g:link controller="POI" action="show" id="${poiItem.id}">
            <div class="card">
                <h2>${fieldValue(bean: poiItem, field: "name")}</h2>

                <p>${fieldValue(bean: poiItem, field: "description")}</p>

                <p>Parcours: <g:link controller="parcours" action="show"
                                     id="${POI?.parcours?.id}">${fieldValue(bean: poiItem, field: "parcours.name")}</g:link></p>
                <ul class="image-list">
                    <g:each in="${poiItem.illustrationList}" var="illustration">
                        <li class="image-item">
                            <g:link controller="illustration" action="show" id="${illustration.id}">
                                <img src="${grailsApplication.config.illustrations.url + illustration.name}"/>
                            </g:link>
                        </li>
                    </g:each>
                </ul>
            </div>
        </g:link>
    </g:each>
    </g:each>
    </div>
            <div class="pagination">
            <g:paginate total="${POICount ?: 0}"/>
        </div>
    </div>
    </body>
</html>