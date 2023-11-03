<%@ page import="com.mbds.parcours.Illustration" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>

        <div id="create-user" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
                <li></li>
            </ul>
            </g:hasErrors>
                <g:form controller="user" action="save" id="${user.id}" method="POST" enctype="multipart/form-data">
                        <fieldset class="form">
                            <div class="fieldcontain required">
                                <label for="username">Username
                                    <span class="required-indicator">*</span>
                                </label><input type="text" name="username" value="" required="" id="username">
                            </div>
                            <div class="fieldcontain required">
                                <label for="password">Password
                                    <span class="required-indicator">*</span>
                                </label><input type="password" name="password" required="" value="" id="password">
                            </div><div class="fieldcontain required">
                            <label for="email">Email
                                <span class="required-indicator">*</span>
                            </label><input type="email" name="email" value="" required="" id="email">
                        </div>

                            <div class="fieldcontain" style="display: flex">
                            <label for="thumbnail">Thumbnail</label>
                            <input type="file"  name="file" id="thumbnail" />

                        </fieldset>  </div>
                        <fieldset class="buttons">
                            <input type="submit" name="create" class="save" value="Create" id="create">
                        </fieldset>
                </g:form>
                </div>
        </div>

    </body>
</html>
