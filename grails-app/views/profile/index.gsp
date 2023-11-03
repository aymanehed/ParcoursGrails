<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>View Map</title>
    <asset:stylesheet src="profile.css"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
<div class="container">
    <input type="checkbox" id="switch">

    <div class="outer">
        <div class="content">
            <label for="switch">
                <span class="toggle">
                    <span class="circle"></span>
                </span>
            </label>
            <g:if test="${currentUser.thumbnail}">
                <g:link style="cursor: pointer;" id="${currentUser.id}">
                    <g:if test="{${currentUser.thumbnail?.name}">
                        <asset:image src="${currentUser.thumbnail?.name}" style="width: 150px"/></g:if>

                </g:link>

            </g:if>
            <g:if test="${currentUser.thumbnail == null}">
                <asset:image src="profile.png" style="width: 150px"/>
            </g:if>


            <div class="details">
                <div class="username">${currentUser.username}</div>

                <div class="email">${currentUser.email}</div>

                <div  style="display: flex " >
                    <g:link class="edit" controller="profile" action="edit" resource="${this.user}">
                        <button style="margin: 10px "><g:message code="default.button.edit.label" default="Edit"/></button>
                    </g:link>


                    <g:link class="edit" controller="user" action="home" resource="${this.user}">
                        <button style="margin: 10px "><g:message code="default.button.home.label" default="home"/></button>
                    </g:link>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>
