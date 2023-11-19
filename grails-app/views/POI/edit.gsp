<%@ page import="org.springframework.validation.FieldError; com.mbds.parcours.Parcours" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'POI.label', default: 'POI')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
    <asset:stylesheet src="editPoi.css"/>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAP18kvzxfaxA3_LHZlN_kKdc8u0qmcaE0&callback=initMap"
            async defer></script>
    <asset:javascript src="poimap.js"/>
</head>

<body>
<a href="#edit-POI" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                          default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
        <g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_USER')}">
            <li><g:link class="list" controller="profile" action="MesParcours">Mes Parcours</g:link></li>
        </g:if>
        <g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_ADMIN')}">
            <li><g:link class="list" controller="poi" action="index"><g:message code="default.list.label"
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
                <li <g:if test="${error in FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form resource="${this.POI}" method="post" controller="POI" action="update">
        <g:hiddenField name="version" value="${this.POI?.version}"/>
        <fieldset class="form">
            <input type="hidden" name="version" value="0" id="version">
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
                    <label for="parcours">Parcours
                        <span class="required-indicator">*</span>
                    </label>
                    <g:select name="parcours" from="${Parcours.list()}" optionKey="id" optionValue="name"
                              required="true"/>

                <div class="fieldcontain">
                    <ul class="image-list">
                        <g:each in="${POI.illustrationList}" var="illustration">
                            <li class="image-item">
                                <g:link controller="illustration" action="show" id="${illustration.id}">
                                    <img src="${grailsApplication.config.illustrations.url + illustration.name}" alt="${illustration.name}"/>
                                </g:link>
                            </li>
                        </g:each>
                    </ul>
                </div>
                    <div id="map" class="form-input-inline" style="width: 100%; height: 300px;"></div>
            </fieldset>
            <fieldset class="buttons">
                <input class="save" type="submit"
                       value="${message(code: 'default.button.update.label', default: 'Update')}">
            </fieldset>
        </fieldset>
    </g:form>
</div>
</body>
</html>
