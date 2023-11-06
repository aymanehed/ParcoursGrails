<%@ page import="com.mbds.parcours.Parcours" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'POI.label', default: 'POI')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
    <asset:stylesheet src="editPoi.css"/>
</head>

<body>
<a href="#edit-POI" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                          default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a>
        </li><g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_USER')}">
        <li><g:link class="list" controller="profile" action="MesParcours">Mes Parcours</g:link></li>
    </g:if>
        <g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_ADMIN')}">
            <li><g:link class="list" controller="parcours" action="index"><g:message code="default.list.label"
                                                                                     args="[entityName]"/></g:link></li>
        </g:if>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="edit-POI" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.POI}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.POI}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form resource="${this.POI}" method="post" controller="POI" action="update">
        <g:hiddenField name="version" value="${this.POI?.version}"/>
        <fieldset class="form">
            <f:all bean="POI"/>
        </fieldset>
        <fieldset class="buttons">
            <input class="save" type="submit"
                   value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        </fieldset>
    </g:form>
</div>
</body>
<head>
    <meta name="layout" content="navbar"/>
    <g:set var="entityName" value="${message(code: 'POI.label', default: 'POI')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
    <asset:stylesheet src="edit.css"/>
</head>

<body>
<a href="#edit-POI" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                          default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="edit-POI" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.POI}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.POI}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form controller="POI" action="update" id="${POI.id}" method="POST" enctype="multipart/form-data">
        <g:hiddenField name="version" value="${this.POI?.version}"/>
        <fieldset class="form">
            <fieldset class="form">
                <div class="fieldcontain required">
                    <label for="name">Name
                        <span class="required-indicator">*</span>
                    </label><input type="text" name="name" value="${POI.name}" required="" id="name">
                </div>

                <div class="fieldcontain required">
                    <label for="description">Description
                        <span class="required-indicator">*</span>
                    </label><input type="text" name="description" value="${POI.description}" required=""
                                   id="description">
                </div>

                <div class="fieldcontain required">
                    <label for="latitude">Latitude
                        <span class="required-indicator">*</span>
                        %{--                        Utiliser [0-9]*,?[0-9]* et non un nombre.--}%
                    </label><input type="text" inputmode="decimal" name="latitude" value="${POI.latitude}" required=""
                                   id="latitude">
                </div>

                <div class="fieldcontain required">
                    <label for="longitude">Longitude
                        <span class="required-indicator">*</span>
                        %{--                        Utiliser [0-9]*,?[0-9]* et non un nombre.--}%
                    </label><input type="text" inputmode="decimal" name="longitude" value="${POI.longitude}" required=""
                                   id="longitude">
                </div>

                <div class="fieldcontain required">
                    <label for="parcours">Parcours
                        <span class="required-indicator">*</span>
                    </label>
                    <g:select name="parcours" from="${Parcours.list()}" optionKey="id" value="${POI.parcours?.name}"/>
                </div>

                <div class="fieldcontain">
                    <label for="illustrationList">Illustration</label>
                    <ul class="image-list">
                        <g:each in="${POI.illustrationList}" var="i" status="iCount">
                            <li class="image-item">
                                <a href="${createLink(controller: 'illustration', action: 'show', id: i.id)}">
                                    <img src="${grailsApplication.config.illustrations.url + i.name}"
                                         alt="Illustration ${i.id}"/>
                                </a>
                            </li>
                        </g:each>
                    </ul>
                </div>

            </fieldset>
        </fieldset>
        <input class="save" type="submit"
               value="${message(code: 'default.button.update.label', default: 'Update')}"/>
    </g:form>
</div>
</body>
</html>
