<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>View Map</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
<asset:stylesheet src="UserIndex.css"/>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
        <li> <g:link class="create" action="create">New User</g:link></li>
        <li><g:link controller="logout" action="index"> <asset:image src="logout.png" width="18px"/> Logout</g:link></li>
    </ul>
</div>

<div id="list-user" class="content scaffold-list" role="main">
    <h2 style="padding-left:20px  ">User List</h2>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <th class="sortable"><a href="/user/index?sort=username&amp;max=10&amp;order=asc" id="a">Username</a></th>
            <th class="sortable"><a href="/user/index?sort=email&amp;max=10&amp;order=asc" id="a">Email</a></th>
            <th>Thumbnail</th>
            <th>Role</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${userList}" var="user">
            <tr>
                <td style>
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