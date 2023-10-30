<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to ViewMap</title>
</head>

<body>
<content tag="nav">
<g:if test="${session.user == null}">
    <li class="dropdown">
        <g:link controller="login" action="auth">Login</g:link>
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

</body>
</html>
