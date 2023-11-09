<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'illustration.label', default: 'Illustration')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <asset:stylesheet src="Illustration_CSS/Illu_index.css"/>
</head>

<body>
<a href="#list-illustration" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                   default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-illustration" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <th>Thumbnail</th>
            <th><a href="/illustration/index?sort=name&amp;max=10&amp;order=asc">Name</a></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${illustrationList}" status="i" var="illustration">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><img style="cursor: pointer;" src="${grailsApplication.config.illustrations.url + illustration.name}" alt="Thumbnail"/></td>
                <td><g:link action="show"
                            id="${illustration.id}">${fieldValue(bean: illustration, field: "name")}</g:link></td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${illustrationCount ?: 0}"/>
    </div>
</div>
</body>
</html>