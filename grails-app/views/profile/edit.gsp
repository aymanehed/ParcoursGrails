<%@ page import="com.mbds.parcours.Role" %>
<!DOCTYPE html>
<html>
<head>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title>View Map</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="edit.css"/>
    <asset:javascript src="DragAndDrop.js"/>
</head>

<body>
<div id="edit-user" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.user}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
            <li><g:link controller="logout" action="index"><asset:image src="logout.png"
                                                                        width="18px"/> Logout</g:link></li>
        </ul>
    </g:hasErrors>
    <g:form controller="profile" action="update" id="${user.id}" method="POST" enctype="multipart/form-data">
        <g:hiddenField name="version" value="${this.user?.version}"/>
        <fieldset class="form">

            <div>
                <label for="username">Username
                </label><input type="text" name="username" value="${user.username}" required="" id="username">
            </div>

            <div >
                <label for="password">Password
                </label><input type="password" name="password"  value="${user.password}" required=""  id="password">
            </div>

            <div >
                <label for="email">Email
                </label><input type="email" name="email" value="${user.email}" required="" id="email">
            </div>


            <div class="image-upload-container">
                <div class="file-drop-area">
                    <span class="file-label">Drop file here or click to upload</span>
                    <input type="file" name="file" class="drop-zone__input">
                </div>
            </div>

            <div class="image-preview" id="image-preview">
                <g:if test="${user.thumbnail == null}">
                    <asset:image src="profile.png " style="width: 150px"/>
                </g:if>
                <g:else>
                    <g:link style="cursor: pointer;" action="deleteThumb" id="${user.id}">
                        <asset:image src="${user.thumbnail?.name}" style="width: 150px"/>
                    </g:link></g:else>

            </div>
        </fieldset>
        <input class="save" type="submit"
               value="${message(code: 'default.button.update.label', default: 'Update')}"/>
    </g:form>
</div>
</body>
</html>
