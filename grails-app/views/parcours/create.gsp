<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'parcours.label', default: 'Parcours')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <asset:javascript src="DragAndDrop.js"/>
</head>

<body>
<a href="#create-parcours" class="skip" tabindex="-1">
    <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
</a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
        <g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_USER')}">
            <li><g:link class="list" controller="profile" action="MesParcours">Mes Parcours</g:link></li>
        </g:if>
        <g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_ADMIN')}">
            <li><g:link class="list" controller="parcours" action="index"><g:message code="default.list.label"
                                                                                     args="[entityName]"/></g:link></li>
        </g:if>
        <li>
            <g:link controller="logout" action="index">
                <asset:image src="logout.png" width="18px"/>
                Logout
            </g:link>
        </li>
    </ul>
</div>

<div id="create-parcours" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.parcours}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.parcours}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                    <g:message error="${error}"/>
                </li>
            </g:eachError>
        </ul>
    </g:hasErrors>
<div class="d-flex">
    <g:form controller="parcours" action="save" enctype="multipart/form-data">
        <div  style="margin: 17px ; padding: 14px;"> Name <span class="required">*</span></span>
        <input type="text" name="name" value=""  id="name" style=" height:40px;width: 73.7%"/></div>
<div >Description  <span class="required">*</span></span>
        <input type="text"  name="description"  id="description"  style="height: 100px; width: 70%"/></div>


             <div class="image-upload-container">
                        <div class="file-drop-area">
                            <span class="file-label">Drop file here or click to upload</span>
                            <input type="file" name="file" class="drop-zone__input" >
                        </div>
                    </div>
        </div>
        <fieldset class="buttons" style="margin-top: 80px ;margin-right: -60px">
            <button type="submit" name="create" class="save">
        ${message(code: 'default.button.create.label', default: 'Create')}
        </button>
    </fieldset>
    </g:form>
</div>
</body>
</html>
