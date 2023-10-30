<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to ViewMap</title>
</head>

<body>
<g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_ADMIN')}">
    <content tag="nav">
%{--    <li class="dropdown">--}%
%{--        <a href="/parcours/List">Parcours</a>--}%
%{--    <li class="dropdown">--}%
%{--        <a href="/POI/index">Interests</a>--}%
%{--    </li>--}%
    <g:if test="${session.user == null}">
        <li class="dropdown">
            <g:link controller="user" action="index">List Users</g:link>
        <li class="dropdown">
            <g:link controller="POI" action="index">List Parcours</g:link>
        </li>

        </g:if>
    </content>
</g:if>
    <g:else>


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
            <li class="dropdown">
                <g:link controller="profile" action="index">Profile</g:link>
            </li>
    </g:if>

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
<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>

<div id="content" role="main">
    <section class="row colset-2-its">

    </section>
</div>
    </g:else>

</body>
</html>
