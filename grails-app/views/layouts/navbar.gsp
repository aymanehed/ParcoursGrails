<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>View Map</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="navbar.css"/>
    <asset:javascript src="navbar.js"/>
    <g:layoutHead/>
</head>

<body>
<div id="menu">
    <div id="menu-bar" onclick="menuOnClick()">
        <div id="bar1" class="bar"></div>
        <div id="bar2" class="bar"></div>
        <div id="bar3" class="bar"></div>
    </div>
    <nav class="nav" id="nav">
        <ul>
           <sec:ifLoggedIn>
               <g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_USER')}">
                <li>
                    <g:link controller="user" action="home"> Home</g:link>
                </li>
                <li>
                    <g:link controller="profile" action="MesParcours">MesParcours</g:link>
                </li>
                <li>
                    <g:link controller="profile" action="MesPois"> MesPois</g:link>
                </li>
                <li>
                    <g:link controller="profile" action="index">MyProfile</g:link>
                </li>
                <li>
                    <g:link controller="logout" action="index"> Logout</g:link>
                </li>
               </g:if>
               </sec:ifLoggedIn>
        </ul>
    </nav>
</div>

<div class="menu-bg" id="menu-bg"></div>
<script>
    function menuOnClick() {
        document.getElementById("menu-bar").classList.toggle("change");
        document.getElementById("nav").classList.toggle("change");
        document.getElementById("menu-bg").classList.toggle("change-bg");
    }
</script>
<g:layoutBody/>
</body>
</html>