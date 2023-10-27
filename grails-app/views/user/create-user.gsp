<html lang="en" class="no-js"><head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>
    Create User
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-ico" href="/assets/favicon.ico">

    <link rel="stylesheet" href="/assets/bootstrap.css?compile=false">
    <link rel="stylesheet" href="/assets/grails.css?compile=false">
    <link rel="stylesheet" href="/assets/main.css?compile=false">
    <link rel="stylesheet" href="/assets/mobile.css?compile=false">
    <link rel="stylesheet" href="/assets/application.css?compile=false">



    <meta name="layout" content="main">



</head>
<body data-new-gr-c-s-check-loaded="14.1135.0" data-gr-ext-installed="">

<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/#">
                <img src="/assets/grails.svg" alt="Grails Logo">
            </a>
        </div>
        <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
            <ul class="nav navbar-nav navbar-right">

            </ul>
        </div>
    </div>
</div>


<a href="#create-user" class="skip" tabindex="-1">Skip to content…</a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="/">Home</a></li>
        <li><a href="/user/index" class="list">User List</a></li>
    </ul>
</div>
<div id="create-user" class="content scaffold-create" role="main">
    <h1>Create User</h1>


    <form action="/user/save" method="post">
        <fieldset class="form">
            <div class="fieldcontain required">
                <label for="username">Username
                    <span class="required-indicator">*</span>
                </label><input type="text" name="username" value="" required="" id="username">
            </div>
            <div class="fieldcontain required">
                <label for="password">Password
                    <span class="required-indicator">*</span>
                </label><input type="password" name="password" required="" value="" id="password">
            </div><div class="fieldcontain required">
            <label for="email">Email
                <span class="required-indicator">*</span>
            </label><input type="email" name="email" value="" required="" id="email">
        </div><div class="fieldcontain">
            <label for="thumbnail">Thumbnail</label><select name="thumbnail.id" id="thumbnail">

            </select>
        </div><div class="fieldcontain">
            <label for="passwordExpired">Password Expired</label><input type="hidden" name="_passwordExpired"><input type="checkbox" name="passwordExpired" id="passwordExpired">
        </div><div class="fieldcontain">
            <label for="accountLocked">Account Locked</label><input type="hidden" name="_accountLocked"><input type="checkbox" name="accountLocked" id="accountLocked">
        </div><div class="fieldcontain">
            <label for="parcoursList">Parcours List</label><ul></ul><a href="/parcours/create?user.id=">Add Parcours</a>
        </div><div class="fieldcontain">
            <label for="accountExpired">Account Expired</label><input type="hidden" name="_accountExpired"><input type="checkbox" name="accountExpired" id="accountExpired">
        </div><div class="fieldcontain">
            <label for="enabled">Enabled</label><input type="hidden" name="_enabled"><input type="checkbox" name="enabled" checked="checked" id="enabled">
        </div>
        </fieldset>
        <fieldset class="buttons">
            <input type="submit" name="create" class="save" value="Create" id="create">
        </fieldset>
    </form>
</div>


<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;">
    Loading…
</div>

<script type="text/javascript" src="/assets/jquery-2.2.0.min.js?compile=false"></script>
<script type="text/javascript" src="/assets/bootstrap.js?compile=false"></script>
<script type="text/javascript" src="/assets/application.js?compile=false"></script>
</body><grammarly-desktop-integration data-grammarly-shadow-root="true"></grammarly-desktop-integration></html>