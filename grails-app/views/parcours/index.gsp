<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'parcours.label', default: 'Parcours')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <asset:stylesheet src="parcoursindex.css"/>
</head>

<body>
<a href="#list-parcours" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
<g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_ADMIN') || sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_USER')}">
    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li> </g:if>
        <li> <g:link controller="logout" action="index"> <asset:image src="logout.png" width="18px"/> Logout</g:link> </li>
    </ul>
</div>

<div id="list-parcours" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div class="parcours-grid">
        <g:each in="${parcoursList}" var="parcours">
            <div class="parcours-card">
                <div class="parcours-name">
                    <g:link controller="parcours" action="show" id="${parcours.id}">
                        ${parcours.name}
                    </g:link>
                </div>
                <div class="parcours-description">${parcours.description}</div>
            <g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_ADMIN')}">
                <div class="parcours-author">Author: ${parcours.author.username}</div>
            </g:if>
            </div>
        </g:each>
    </div>

    <div class="pagination">
        <g:paginate total="${parcoursCount ?: 0}"/>
    </div>
</div>
</body>
</html>