<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'parcours.label', default: 'Parcours')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-parcours" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-parcours" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>


    <table>
        <thead>
        <tr>

            <th class="sortable"><a href="/parcours/index?sort=name&amp;max=10&amp;order=asc">Name</a></th>

            <th class="sortable"><a href="/parcours/index?sort=description&amp;max=10&amp;order=asc">Description</a>
            </th>

            <th class="sortable"><a href="/parcours/index?sort=author&amp;max=10&amp;order=asc">Author</a></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${parcoursList}" var="parcours">
            <tr class="even">
                <td>
                    <g:link controller="parcours" action="show" id="${parcours.id}">
                        ${parcours.name}
                    </g:link>
                </td>
                <td>  ${parcours.description }</td>
                <td>${parcours.author.username}</td>
            </tr>
        </g:each>

        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${parcoursCount ?: 0}"/>
    </div>
</div>
</body>
</html>