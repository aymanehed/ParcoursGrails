<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'parcours.label', default: 'Parcours')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>
<a href="#create-parcours" class="skip" tabindex="-1">
    <g:message code="default.link.skip.label" default="Skip to content&hellip;" />
</a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label" /></a></li>
        <g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_USER')}">
            <li><g:link class="list" controller="profile" action="MesParcours">Mes Parcours</g:link></li>
        </g:if>
        <g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_ADMIN')}">
            <li><g:link class="list" controller="parcours" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        </g:if>
        <li>
            <g:link controller="logout" action="index">
                <asset:image src="logout.png" width="18px" />
                Logout
            </g:link>
        </li>
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
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                    <g:message error="${error}" />
                </li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <div class="d-flex">
        <form method="POST" action="${createLink(uri: '/parcours/save')}">
            <div  style="margin: 17px ; padding: 14px;"> Name <span class="required">*</span></span>
            <input type="text" name="name" value=""  id="name" style=" height:40px;width: 73.7%"/></div>
    <div >Description  <span class="required">*</span></span>
            <input type="text"  name="description"  id="description"  style="height: 100px; width: 70%"/></div>

            <div style="margin: 30px "><span class="lname" hidden="">Author</span>
            <select hidden="" name="author.id"  style="padding-right: 10px" required="required" id="author">
                <option value="${currentuser.id}">${currentuser.username}</option>
            </select></div>
            <div style="text-decoration: none" ><label for="illustrationList">Illustration List</label>
            <g:link controller="illustration" action="create" id="${parcours.id} " >Add Illustration</g:link></div>
            <div style="margin: 20px; padding-right: 20px;  " > <label for="poiList">Poi List</label>
  <g:link controller="POI" action="create" id="${parcours.id}" style="margin:28.8px"  > Add POI</g:link>
                </div>

            <fieldset class="buttons" style="margin-top: 80px ;margin-right: -60px">
                <button type="submit" name="create" class="save">
                    ${message(code: 'default.button.create.label', default: 'Create')}
                </button>
            </fieldset>
        </form>
    </div>
</div>
</body>
</html>
