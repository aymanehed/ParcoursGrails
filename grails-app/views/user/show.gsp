<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    <asset:stylesheet src="UserShowForAdmin.css"/>
    </head>
    <body>
        <a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
               <!-- <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            -->
                <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
<g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_ADMIN')}">
    <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
</g:if>
                <li><g:link controller="logout" action="index"> <asset:image src="logout.png" width="18px"/> Logout</g:link></li>

            </ul>
        </div>
        <div id="show-user" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list user">
                <li class="fieldcontain">
                    <span id="username-label" class="property-label">Username</span>
                    <div class="property-value" aria-labelledby="username-label">${user.username}</div>
                </li>
                <li class="fieldcontain">
                    <span id="email-label" class="property-label">Email</span>
                    <div class="property-value" aria-labelledby="email-label">${user.email}</div>
                </li>
                <li class="fieldcontain">
                    <span id="thumbnail-label" class="property-label">Thumbnail</span>
                    <div class="property-value" aria-labelledby="thumbnail-label">
                        <g:if test="${user.thumbnail}">
                            <g:link style="cursor: pointer;" id="${user.id}">
                                <asset:image
                                        src="${user.thumbnail?.name}" style="width: 100px"/></g:link>
                        </g:if>
                    </div>
                </li>
                <li class="fieldcontain">
                    <span id="passwordExpired-label" class="property-label">Password Expired</span>
                    <div class="property-value" aria-labelledby="passwordExpired-label">${user.accountExpired}</div>
                </li>
                <li class="fieldcontain">
                    <span id="accountLocked-label" class="property-label">Account Locked</span>
                    <div class="property-value" aria-labelledby="accountLocked-label">${user.accountLocked}</div>
                </li>
                <li class="fieldcontain">
                    <span id="parcoursList-label" class="property-label">Parcours List</span>
                    <div class="property-value" aria-labelledby="parcoursList-label"><ul>
                            <g:each in="${user.parcoursList}" var="c">
                                <li style="list-style: none"><g:link controller="parcours" action="show" id="${c.id}">${c?.name}</g:link></li>
                            </g:each>
                    </ul></div>
                </li>
                <li class="fieldcontain">
                    <span id="accountExpired-label" class="property-label">Account Expired</span>
                    <div class="property-value" aria-labelledby="accountExpired-label">${user.accountExpired}</div>
                </li>
                <li class="fieldcontain">
                    <span id="enabled-label" class="property-label">Enabled</span>
                    <div class="property-value" aria-labelledby="enabled-label">${user.enabled}</div>
                </li>
            </ol>
            <g:form resource="${this.user}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.user}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
