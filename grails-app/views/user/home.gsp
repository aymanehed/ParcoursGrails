<!DOCTYPE html>
  <html lang="en">
  <g:if test="${sec.loggedInUserInfo(field: 'authorities')?.contains('ROLE_USER')}">
  <head>
 <meta name="layout" content="main"/>
     <title>Welcome to ViewMap</title>
  </head>
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
        <asset:stylesheet src="responsive.css"/>
        <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    </head>

    <body>

    <!-- for header part -->
    <header>
        <div class="logosec">
            <div class="logo">ViewMap</div>
        </div>
    </header>
    <div class="main-container">
        <div class="navcontainer">
            <nav class="nav">
                <div class="nav-upper-options">
                    <g:link controller="user" action="home">
                    <div class="nav-option option1">
                        <asset:image src="dashboard.png"
                                class="nav-img"
                                alt="dashboard"  />
                        <p> Dashboard</p>
                    </div></g:link>
                    <g:link controller="user" action="index">
                    <div class="nav-option option2">
                        <asset:image src="users.png"   class="nav-img" alt="users"/>
                        <p> Users</p>
                    </div>
                    </g:link>
                    <g:link controller="parcours" action="index" >
                    <div class="nav-option option3">
                        <asset:image src="parcours.png"   class="nav-img" alt="Parcours" />
                        <p> Parcours</p>
                    </div>
                    </g:link>
                    <g:link controller="logout" action="index">
                        <div class="nav-option option4">
                        <asset:image src="logout.png"   class="nav-img" alt="Logout"/>
                        <p> Logout</p>
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

                    <asset:image src="user.png"   class="nav-img" alt="Logout"/>
                </div>

                <div class="box box2">
                    <div class="text">
                        <h2 class="topic-heading">${parcoursCount}</h2>
                        <h2 class="topic">Parcours</h2>
                    </div>

                    <img src=
                         "https://media.geeksforgeeks.org/wp-content/uploads/20221210185030/14.png"
                         alt="likes">
                </div>

                <div class="box box3">
                    <div class="text">
                        <h2 class="topic-heading">122</h2>
                        <h2 class="topic">POI</h2>
                    </div>

                    <img src=
                         "https://media.geeksforgeeks.org/wp-content/uploads/20221210184645/Untitled-design-(32).png"
                         alt="comments">
                </div>


            </div>

            <div class="report-container">
                <div class="report-header">
                    <h1 class="recent-Articles">Recent Articles</h1>
                    <button class="view">View All</button>
                </div>

                <div class="report-body">
                    <div class="report-topic-heading">
                        <h3 class="t-op">Article</h3>
                        <h3 class="t-op">Views</h3>
                        <h3 class="t-op">Comments</h3>
                        <h3 class="t-op">Status</h3>
                    </div>

                    <div class="items">
                        <div class="item1">
                            <h3 class="t-op-nextlvl">Article 73</h3>
                            <h3 class="t-op-nextlvl">2.9k</h3>
                            <h3 class="t-op-nextlvl">210</h3>
                            <h3 class="t-op-nextlvl label-tag">Published</h3>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <asset:javascript src="script.js"/>
    </body>
</g:if>
<g:else>

    <body>
        <content tag="nav">
        <g:if test="${session.user == null}">
            <li class="dropdown">
                <g:link controller="parcours" action="index">Parcours</g:link>
            <li class="dropdown">
                <g:link controller="POI" action="index">Interests</g:link>
            </li>
            <li class="dropdown">
                <g:link controller="profile" action="index">Profile</g:link>
            </li>
            <li class="dropdown"> <g:link controller="logout" action="index"> <asset:image src="logout.png" width="18px"/> Logout</g:link></li>
        </g:if>
    </content>





    <div id="content1" role="main">
        <section class="row colset-2-its">

        </section>
    </div>
    </body>
</g:else>
  </html>
