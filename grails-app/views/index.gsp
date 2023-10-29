<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to ViewMap</title>
</head>

<body>
<content tag="nav">
%{--    <li class="dropdown">--}%
%{--        <a href="/parcours/List">Parcours</a>--}%
%{--    <li class="dropdown">--}%
%{--        <a href="/POI/index">Interests</a>--}%
%{--    </li>--}%
    <g:if test="${session.user == null}">
        <li class="dropdown">
            <g:link controller="parcours" action="index">Parcours</g:link>
        <li class="dropdown">
            <g:link controller="POI" action="index">Interests</g:link>
        </li>
        <sec:ifNotLoggedIn>
            <li class="dropdown">

                <g:link controller="login" action="index">Login</g:link></li></sec:ifNotLoggedIn>
        <sec:ifLoggedIn>
            <li class="dropdown">

                <g:link controller="logout" action="index">Logout</g:link></li></sec:ifLoggedIn>
    </g:if>

</content>


<div id="content" role="main">
    <section class="row colset-2-its">

    </section>
</div>
</body>
</html>
