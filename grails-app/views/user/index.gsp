<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li> <g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
        <li><g:link controller="logout" action="index"> <asset:image src="logout.png" width="18px"/> Logout</g:link></li>
    </ul>
</div>

<div id="list-user" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <th class="sortable"><a href="/user/index?sort=username&amp;max=10&amp;order=asc">Username</a></th>
            <th class="sortable"><a href="/user/index?sort=email&amp;max=10&amp;order=asc">Email</a></th>
            <th>Thumbnail</th>
            <th>Role</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${userList}" var="user">
            <tr>
                <td>
                    <g:link controller="user" action="show" id="${user.id}">
                        <g:fieldValue field="username" bean="${user}"/>
                    </g:link>
                    %{--                ${user.username}--}%
                </td>
                <td>
                    <g:fieldValue field="email" bean="${user}"/>
                </td>
                <td>
                    <g:if test="${user.thumbnail}">
                        <img src="${grailsApplication.config.illustrations.url + user.thumbnail.name}"/>
                    %{--                        <asset:image src="${user.thumbnail.name}"/>--}%
                    </g:if>
                </td>
                <td>
                    ${user.getAuthorities()*.authority.join(',')}
                </td>
            </tr>
        </g:each>

        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${userCount ?: 0}"/>
    </div>
</div>
</body>
</html>