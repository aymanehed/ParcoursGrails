<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'parcours.label', default: 'Parcours')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-parcours" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li> <g:link controller="logout" action="index"> <asset:image src="logout.png" width="18px"/> Logout</g:link> </li>
            </ul>
        </div>
        <div id="create-parcours" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.parcours}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.parcours}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.parcours}" method="POST">
                <fieldset class="form">
<div class="fieldcontain required">
  <label for="name">Name
    <span class="required-indicator">*</span>
  </label><input type="text" name="name" value="" required="" id="name">
</div><div class="fieldcontain required">
  <label for="description">Description
    <span class="required-indicator">*</span>
  </label><input type="text" name="description" value="" required="" id="description">
</div>
                    <div class="fieldcontain required">
                        <label for="author">Author
                            <span class="required-indicator">*</span>
                        </label><select name="author.id" required="" id="author">
                        <option value="${currentuser.id}">${currentuser.username}</option>
                    </select>
                      </div>
                    <div class="fieldcontain">
                <label for="illustrationList">Illustration List</label>
                    <g:link controller="illustration" action="create" id="${parcours.id}">Add Illustration</g:link>
                    <ul></ul>
            </div><div class="fieldcontain">
                <label for="poiList">Poi List</label>
                    <g:link controller="POI" action="create" id="${parcours.id}">Add POI</g:link>
                </div><ul></ul>






                        </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
