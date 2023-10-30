<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to ViewMap</title>
</head>
<body>
<content tag="nav">
        <li class="dropdown">
            <g:link controller="parcours"  action="index" >Parcours</g:link>
           <li class="dropdown">
    <g:link controller="POI"  action="index" >Interests</g:link>
        </li>
    <sec:ifNotLoggedIn>
            <li class="dropdown">

                <g:link controller="login" action="index">Login </g:link>  </li></sec:ifNotLoggedIn>
    <sec:ifLoggedIn>
    <li class="dropdown">

            <g:link controller="logout"  action="index" >Logout</g:link>  </li></sec:ifLoggedIn>

    </content>


    <div id="content" role="main">
        <section class="row colset-2-its">
            <div class="slideshow-container">
                <div class="mySlides fade">
                    <asset:image src="img1.png" />
                </div>
                <div class="mySlides fade">
                    <asset:image src="img4.jpg" style="width: 100%" />
                </div>
                <div class="mySlides fade">
                    <asset:image src="img3.png" />
                </div>

            </div>
            <br>

            <div style="text-align:center">
                <span class="dot"></span>
                <span class="dot"></span>
                <span class="dot"></span>
            </div>

            <script>
                let slideIndex = 0;
                showSlides();

                function showSlides() {
                    let i;
                    let slides = document.getElementsByClassName("mySlides");
                    let dots = document.getElementsByClassName("dot");
                    for (i = 0; i < slides.length; i++) {
                        slides[i].style.display = "none";
                    }
                    slideIndex++;
                    if (slideIndex > slides.length) {slideIndex = 1}
                    for (i = 0; i < dots.length; i++) {
                        dots[i].className = dots[i].className.replace(" active", "");
                    }
                    slides[slideIndex-1].style.display = "block";
                    dots[slideIndex-1].className += " active";
                    setTimeout(showSlides, 2000); // Change image every 2 seconds
                }
            </script>
        </section>
    </div>
<div id="login">
    <div class="inner">
        <div class="fheader"><g:message code='springSecurity.login.header'/></div>
<g:if test='${flash.message}'>
    <div class="login_message">${flash.message}</div>
</g:if>

<form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
    <p>
        <label for="username"><g:message code='springSecurity.login.username.label'/>:</label>
        <input type="text" class="text_" name="${usernameParameter ?: 'username'}" id="username"/>
    </p>

    <p>
        <label for="password"><g:message code='springSecurity.login.password.label'/>:</label>
        <input type="password" class="text_" name="${passwordParameter ?: 'password'}" id="password"/>
    </p>

    <p id="remember_me_holder">
        <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
        <label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>
    </p>
    <div class="row button">
        <input type="submit" id="submit"  value="${message(code: 'springSecurity.login.button')}"/>
        <div class="signup-link">Not a member? <g:link controller="user" action="create">Signup now</g:link></div>

    </div>

</form>
</div>
</div>
<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>
