<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'illustration.label', default: 'Illustration')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <asset:stylesheet src="Illustration_CSS/Illu_show.css"/>
</head>

<body>
<a href="#show-illustration" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                   default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-illustration" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list illustration">
        <li class="fieldcontain">
            <span id="name-label" class="property-label">Name</span>

            <div class="property-value" aria-labelledby="name-label">${illustration.name}</div>
        </li>
    </ol>
    <ol class="property-list illustration">
        <li class="fieldcontain">
            <div class="property-value" aria-labelledby="image-label">
                <span id="img-label" class="property-label">Image</span>
                <img style="cursor: pointer;" src="${grailsApplication.config.illustrations.url + illustration.name}" alt="Thumbnail"/>
            </div>
        </li>
    </ol>
    <g:form resource="${this.illustration}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.illustration}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
