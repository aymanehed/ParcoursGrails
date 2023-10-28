<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to ViewMap</title>
</head>

<body>
<content tag="nav">
    <li class="dropdown">
        <a href="/parcours/List">Parcours</a>
    <li class="dropdown">
        <a href="/POI/index">Interests</a>
    </li>
    <g:if test="${session.user == null}">
        <li class="dropdown">
            <g:link controller="logout" action="index">Logout</g:link>
        </li>
    </g:if>
</content>


<div id="content" role="main">
    <section class="row colset-2-its">

    </section>
</div>
</body>
</html>
