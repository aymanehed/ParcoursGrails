<html>
<head>
    <asset:stylesheet src="form.css"/>
    <asset:javascript src="form.js"/>
    <title>View Map</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

</head>
<body>
<div class="container" id="container">
    <div class="form-container sign-up-container">
        <g:form controller="signup" action="register" method="post" id="signupform" autocomplete="off" enctype="multipart/form-data">
            <h1>create account</h1>

            <g:if test="${flash.message}">
                <div class="signup_message" style="color: red">${flash.message}</div>
            </g:if>
            <input type="text" placeholder="name" name="${usernameparameter ?: 'username'}"  id="username" />
            <input type="email" placeholder="email"  name="email" id="email" />
            <input type="password" placeholder="password"  name="${passwordparameter ?: 'password'}" id="password" />
            <button>sign up</button>
        </g:form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-right">
                <h1>welcome back!</h1>
                <p>to keep connected with us please login with your personal info</p>
                <g:link controller="login" action="auth"><button class="ghost" id="login">sign in</button></g:link>
            </div>
        </div>
    </div>
</div>
</body>
</html>