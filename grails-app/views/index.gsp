<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>View Map</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
    <asset:stylesheet src="caroussel.css"/>
    <asset:javascript src="caroussel.js"/>
    <asset:stylesheet src="blueButton.css"/>
</head>
<body>
<content class="navbar">
    <g:link controller="login" action="auth">
        <button class="glow-on-hover" type="button">Login</button>
    </g:link>
</content>
<div class="carousel">

    <div class="carousel_inner">

        <div class="carousel_item carousel_item__active">
            <asset:image src="img3.jpg" class="carousel_img" />
        </div>
        <div class="carousel_item">
            <asset:image src="img4.jpg" class="carousel_img"/>
        </div>
        <div class="carousel_item">
            <asset:image src="img5.jpg" class="carousel_img"/>
        </div>
    </div>

    <div class="carousel_indicator">
        <button class="carousel_dot carousel_dot__active"></button>
        <button class="carousel_dot"></button>
        <button class="carousel_dot"></button>
    </div>

    <div class="carousel_control">
        <button class="carousel_button carousel_button__prev">
            <i class="fas fa-chevron-left"></i>
        </button>
        <button class="carousel_button carousel_button__next">
            <i class="fas fa-chevron-right"></i>
        </button>
    </div>
</div>


</body>
</html>
