<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'POI.label', default: 'POI')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <style>
    /* Reset some default browser styles */
    body, h1, h2, h3, ul, li {
        margin: 0;
        padding: 0;
    }

    /* Set a background color for the entire page */
    body {
        background-color: #f5f5f5;
        font-family: Arial, sans-serif;
    }

    /* Navigation */
    .nav {
        background-color: #333;
        color: #fff;
        text-align: center;
        padding: 10px 0;
    }

    .nav ul {
        list-style: none;
        padding: 0;
    }

    .nav ul li {
        display: inline;
        margin-right: 20px;
    }

    .nav a {
        color: #fff;
        text-decoration: none;
    }

    /* Content Container */
    .content {
        background-color: #fff;
        margin: 20px;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
        font-size: 24px;
        margin-bottom: 20px;
    }

    /* Table Styles */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    table, th, td {
        border: 1px solid #ccc;
    }

    th, td {
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #333;
        color: #fff;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f5f5f5;
    }

    /* Centrer la pagination */
    .pagination {
        text-align: center;
    }

    .pagination li {
        display: inline;
        margin: 0 5px;
    }

    /* Ajouter du style aux éléments de pagination */
    .pagination a {
        text-decoration: none;
        padding: 5px 10px;
        background-color: #333;
        color: #fff;
        border-radius: 5px;
    }

    /* Ajouter du style à l'élément actif (page actuelle) */
    .pagination li.active a {
        background-color: #4CAF50;
    }

    /* Ajouter un style pour les liens "Suivant" et "Précédent" */
    .pagination li.prev a,
    .pagination li.next a {
        background-color: #007bff;
    }

    .image-list {
        list-style: none;
        padding: 0;
        margin: 20px 0;
    }

    .image-item {
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
        background-color: #fff;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    }

    .image-item img {
        max-width: 100%;
        height: auto;
        display: block;
        margin: 0 auto;
    }

    /* Message Box */
    .message {
        padding: 10px;
        margin: 10px 0;
        background-color: #4CAF50;
        color: #fff;
        text-align: center;
        border-radius: 5px;
    }

    </style>
</head>

<body>
<a href="#list-POI" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                          default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-POI" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th class="sortable"><a href="/POI/index?sort=name&amp;max=10&amp;order=asc">Name</a></th>

            <th class="sortable"><a href="/POI/index?sort=description&amp;max=10&amp;order=asc">Description</a></th>

            <th class="sortable"><a href="/POI/index?sort=latitude&amp;max=10&amp;order=asc">Latitude</a></th>

            <th class="sortable"><a href="/POI/index?sort=longitude&amp;max=10&amp;order=asc">Longitude</a></th>

            <th class="sortable"><a href="/POI/index?sort=parcours&amp;max=10&amp;order=asc">Parcours</a></th>

            <th class="sortable"><a
                    href="/POI/index?sort=illustrationList&amp;max=10&amp;order=asc">Illustration List</a></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${POIList}" var="POI">
            <tr>
                <td>
                    <g:link action="show" id="${POI.id}">${fieldValue(bean: POI, field: "name")}</g:link>
                </td>
                <td>
                    ${fieldValue(bean: POI, field: "description")}
                </td>
                <td>
                    ${fieldValue(bean: POI, field: "latitude")}
                </td>
                <td>
                    ${fieldValue(bean: POI, field: "longitude")}
                </td>
                <td>
                    <g:link controller="parcours" action="show" id="${POI?.parcours?.id}">
                        ${fieldValue(bean: POI, field: "parcours.name")}
                    </g:link>
                </td>
                <td>
                    <ul class="image-list">
                        <g:each in="${POI.illustrationList}" var="illustration">
                            <li class="image-item">
                                <g:link controller="illustration" action="show" id="${illustration.id}">
                                    <img src="${grailsApplication.config.illustrations.url + illustration.name}"/>
                                </g:link>
                            </li>
                        </g:each>
                    </ul>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${POICount ?: 0}"/>
    </div>
</div>
</body>
</html>