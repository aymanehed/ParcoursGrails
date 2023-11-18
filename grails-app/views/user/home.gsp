<!DOCTYPE html>
  <html lang="en"><
  <g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_USER')}">
  <head>
 <meta name="layout" content="navbar"/>
     <title>Welcome to ViewMap</title>
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
      <asset:stylesheet src="caroussel.css"/>
      <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
      <asset:javascript src="caroussel.js"/>
  </head>
      <body>
      <div class="carousel">
          <div class="carousel_inner">
              <div class="carousel_item carousel_item__active">
                  <asset:image src="img2.jpg" class="carousel_img"/>
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
  </g:if>
<g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_ADMIN')}">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible"
              content="IE=edge">
        <meta name="viewport"
              content="width=device-width,
				initial-scale=1.0">
        <title>ViewMap</title>
        <asset:stylesheet src="style.css"/>
        <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
        <asset:stylesheet src="responsive.css"/>
    </head>

    <body>

    <!-- for header part -->
    <header>
        <div class="logosec">
            <div class="logo">ViewMap</div>
            <div class="logo" style="margin-left: 760px">Admin Dashboard</div>
        </div>
    </header>
    <div class="main-container">
        <div class="navcontainer">
            <nav class="nav">
                <div class="nav-upper-options">
                    <g:link controller="user" action="home" class="no-underline">
                    <div class="nav-option option1">
                        <asset:image src="dashboard.png"
                                class="nav-img"
                                alt="dashboard"  />
                         Dashboard
                    </div></g:link>
                    <g:link controller="user" action="index">
                    <div class="nav-option option2">
                        <asset:image src="users.png"   class="nav-img" alt="users"/>
                        Users
                    </div>
                    </g:link>
                    <g:link controller="parcours" action="index" >
                    <div class="nav-option option3">
                        <asset:image src="parcours.png"   class="nav-img" alt="Parcours" />
                        Parcours
                    </div>
                    </g:link>
                    <g:link controller="poi" action="index" >
                        <div class="nav-option option5">
                            <asset:image src="pois.png"   class="nav-img" alt="POI" />
                             POI
                        </div>
                    </g:link>
                    <g:link controller="logout" action="index">
                        <div class="nav-option option4">
                        <asset:image src="logout.png"   class="nav-img" alt="Logout"/>
                        Logout
                    </div>
                    </g:link>
                </div>
            </nav>
        </div>
        <div class="main">
            <div class="box-container">

                <div class="box box1">
                    <div class="text">
                        <h2 class="topic-heading">${userCount}</h2>
                        <h2 class="topic">Users</h2>
                    </div>

                    <asset:image src="user.png"   class="nav-img" alt="user"/>
                </div>

                <div class="box box2">
                    <div class="text">
                        <h2 class="topic-heading">${parcoursCount}</h2>
                        <h2 class="topic">Parcours</h2>
                    </div>

                    <asset:image src="parcours.png"   class="nav-img" alt="parcours"/>
                </div>

                <div class="box box3">
                    <div class="text">
                        <h2 class="topic-heading">${poiCount}</h2>
                        <h2 class="topic">POI</h2>
                    </div>
                    <asset:image src="pois.png"   class="nav-img" alt="poi"/>
                </div>


            </div>

            <div class="report-container">
                <div class="report-header">
                    <h1 class="recent-Articles">Recent users</h1>
                    <g:link controller="user" action="index" class="view" style="	text-decoration: none;  border-radius: 20px;border: 1px solid #3f0097;background-color: #3f0097;color: #FFFFFF;height: 25px;text-align: center;font-size: 12px;font-weight: bold;justify-content: center;letter-spacing: 1px;text-transform: uppercase; transition: transform 80ms ease-in;">
                        View All</g:link>
                </div>

                <div class="report-body">
                    <div class="report-topic-heading">
                        <h3 class="t-op">Username</h3>
                        <h3 class="t-op">Email</h3>
                        <h3 class="t-op">Role</h3>
                    </div>
    <g:each in="${userList}" var="user">
                    <div class="items">
                        <div class="item1">
                            <h3 class="t-op-nextlvl">${user.username}</h3>
                            <h3 class="t-op-nextlvl">${user.email}</h3
                            <h3 class="t-op-nextlvl label-tag">${user.getAuthorities().authority[0]}</h3>
                        </div>
        </g:each>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asset:javascript src="script.js"/>
    </body>
</g:if>
<g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_MODERATOR')}">

    <head>
        <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible"
              content="IE=edge">
        <meta name="viewport"
              content="width=device-width,
				initial-scale=1.0">
        <title>ViewMap</title>

        <asset:stylesheet src="style.css"/>
        <asset:stylesheet src="responsive.css"/>
        <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    </head>

    <body>

    <!-- for header part -->
    <header>
        <div class="logosec">
            <div class="logo">ViewMap</div>
            <div class="logo" style="margin-left: 720px">Moderator Dashboard</div>
        </div>
    </header>
    <div class="main-container">
        <div class="navcontainer">
            <nav class="nav">
                <div class="nav-upper-options">
                    <g:link controller="user" action="home" class="no-underline">
                        <div class="nav-option option1">
                            <asset:image src="dashboard.png"
                                         class="nav-img"
                                         alt="dashboard"  />
                            Dashboard
                        </div></g:link>
                    <g:link controller="parcours" action="index" >
                        <div class="nav-option option3">
                            <asset:image src="parcours.png"   class="nav-img" alt="Parcours" />
                            Parcours
                        </div>
                    </g:link>
                    <g:link controller="poi" action="index" >
                        <div class="nav-option option5">
                            <asset:image src="pois.png"   class="nav-img" alt="POI" />
                            POI
                        </div>
                    </g:link>
                    <g:link controller="logout" action="index">
                        <div class="nav-option option4">
                            <asset:image src="logout.png"   class="nav-img" alt="Logout"/>
                            Logout
                        </div>
                    </g:link>
                </div>
            </nav>
        </div>
        <div class="main">
            <div class="box-container">
                <div class="box box2">
                    <div class="text">
                        <h2 class="topic-heading">${parcoursCount}</h2>
                        <h2 class="topic">Parcours</h2>
                    </div>

                    <asset:image src="parcours.png"   class="nav-img" alt="parcours"/>
                </div>

                <div class="box box3">
                    <div class="text">
                        <h2 class="topic-heading">${poiCount}</h2>
                        <h2 class="topic">POI</h2>
                    </div>
                    <asset:image src="pois.png"   class="nav-img" alt="poi"/>
                </div>


            </div>
            <div class="report-container">
                <div class="report-header">
                    <h1 class="recent-Articles">Recent Parcours</h1>
                    <g:link controller="parcours" action="index" class="view" style="	text-decoration: none;  border-radius: 20px;border: 1px solid #3f0097;background-color: #3f0097;color: #FFFFFF;height: 25px;text-align: center;font-size: 12px;font-weight: bold;justify-content: center;letter-spacing: 1px;text-transform: uppercase; transition: transform 80ms ease-in;">
                        View All</g:link>
                </div>

                <div class="report-body">
                    <div class="report-topic-heading">
                        <h3 class="t-op">Name</h3>
                        <h3 class="t-op">Description</h3>
                        <h3 class="t-op">author</h3>
                    </div>
                    <g:each in="${parcoursList}" var="par">
                        <div class="items">
                            <div class="item1">
                                <h3 class="t-op-nextlvl">${par.name}</h3>
                            <h3 class="t-op-nextlvl">${par.description}</h3>
                        <h3 class="t-op-nextlvl">${par.author}</h3>
                        </div>
                    </g:each>
                </div>
                </div>
            </div>
        </div>
    </div>

    <asset:javascript src="script.js"/>
    </body>
</g:if>
  </html>
