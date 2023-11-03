<html>
<head>
    <asset:stylesheet src="form.css"/>
    <asset:javascript src="form.js"/>
    <title>View Map</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

</head>



<body>
<div class="container" id="container">
    <div class="form-container sign-in-container">
        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm"  autocomplete="off">
            <h1>Sign in</h1>
            <g:if test='${flash.message}'>
                <div class="login_message" style="color: red">${flash.message}</div>
            </g:if>
            <input type="text" placeholder="Username" name="${usernameParameter ?: 'username'}"   id="username" />
            <input type="password" placeholder="Password" name="${passwordParameter ?: 'password'}"  id="password" />
          <button>login</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-right">
                <h1>Hello, Friend!</h1>
                <p>Enter your personal details and start journey with us</p>
                <g:link controller="signup" action="register"> <button class="ghost" id="signUp">Sign Up</button></g:link>
            </div>
        </div>
    </div>
</div>
</body>
</html>