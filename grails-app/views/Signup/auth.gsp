<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title><g:message code='springSecurity.signup.title'/></title>
    <style type="text/css" media="screen">
    #signup {
        margin: 15px 0px;
        padding: 0px;
        text-align: center;
    }

    #signup .inner {
        width: 340px;
        padding-bottom: 6px;
        margin: 60px auto;
        text-align: left;
        border: 1px solid #aab;
        background-color: #f0f0fa;
        -moz-box-shadow: 2px 2px 2px #eee;
        -webkit-box-shadow: 2px 2px 2px #eee;
        -khtml-box-shadow: 2px 2px 2px #eee;
        box-shadow: 2px 2px 2px #eee;
    }

    #signup .inner .fheader {
        padding: 18px 26px 14px 26px;
        background-color: #f7f7ff;
        margin: 0px 0 14px 0;
        color: #2e3741;
        font-size: 18px;
        font-weight: bold;
    }

    #signup .inner .cssform p {
        clear: left;
        margin: 0;
        padding: 4px 0 3px 0;
        padding-left: 105px;
        margin-bottom: 20px;
        height: 1%;
    }

    #signup .inner .cssform input[type="text"] {
        width: 120px;
    }

    #signup .inner .cssform label {
        font-weight: bold;
        float: left;
        text-align: right;
        margin-left: -105px;
        width: 110px;
        padding-top: 3px;
        padding-right: 10px;
    }

    #signup #remember_me_holder {
        padding-left: 120px;
    }

    #signup #submit {
        margin-left: 15px;
    }

    #signup #remember_me_holder label {
        float: none;
        margin-left: 0;
        text-align: left;
        width: 200px
    }

    #signup .inner .signup_message {
        padding: 6px 25px 20px 25px;
        color: #c33;
    }

    #signup .inner .text_ {
        width: 120px;
    }

    #signup .inner .chk {
        height: 12px;
    }
    </style>
</head>

<body>
<div id="signup">
    <div class="inner">
        <div class="fheader"><g:message code='springSecurity.signup.header'/></div>

        <g:if test='${flash.message}'>
            <div class="signup_message">${flash.message}</div>
        </g:if>

        <form action="${postUrl ?: '/Signup/auth'}" method="POST" id="signupForm" class="cssform" autocomplete="off">
            <p>
                <label for="username"><g:message code='springSecurity.signup.username.label'/>:</label>
                <input type="text" class="text_" name="${usernameParameter ?: 'username'}" id="username"/>
            </p>

            <p>
                <label for="password"><g:message code='springSecurity.signup.password.label'/>:</label>
                <input type="password" class="text_" name="${passwordParameter ?: 'password'}" id="password"/>
            </p>
            <p>
                <input type="submit" id="submit" value="${message(code: 'springSecurity.signup.button')}" href="/login/auth"/>
            </p>
        </form>
    </div>
</div>
<script>
    (function() {
        document.forms['signupForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>
