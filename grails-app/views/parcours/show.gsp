<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'parcours.label', default: 'Parcours')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-parcours" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-parcours" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

            <div id="show-parcours" class="content scaffold-show" role="main">

                <ol class="property-list parcours">

                    <li class="fieldcontain">
                        <span id="name-label" class="property-label">Name</span>
                        <div class="property-value" aria-labelledby="name-label"> ${parcours.name} </div>
                    </li>

                    <li class="fieldcontain">
                        <span id="description-label" class="property-label">Description</span>
                        <div class="property-value" aria-labelledby="description-label">${parcours.description}</div>
                    </li>

                    <li class="fieldcontain">
                        <span id="author-label" class="property-label">Author</span>
                        <div class="property-value" aria-labelledby="author-label">${parcours.author.username}</div>
                    </li>

                    <li class="fieldcontain">
                    <span id="illustrationList-label" class="property-label">Illustration List</span>
                    <div class="property-value" aria-labelledby="illustrationList-label">
                        <g:each in="${parcours.illustrationList}" var="illustration">

                                <g:img dir="images" file="${illustration.name}"/>

                        </g:each>
                    </div>
                </li>
                    <li class="fieldcontain">
                        <span id="poiList-label" class="property-label">Poi List</span>
                        <div class="property-value" aria-labelledby="poiList-label">
                            <g:each in="${parcours.poiList}" var="POI">
                                    <div> poe n°
                                    ${POI.id}
                                    </div>

                            </g:each>
                        </div>
                     </li>

                </ol>
                <form action="/parcours/delete/1" method="post"><input type="hidden" name="_method" value="DELETE" id="_method">
                    <fieldset class="buttons">
                        <a href="/parcours/edit/1" class="edit">Edit</a>
                        <input class="delete" type="submit" value="Delete" onclick="return confirm('Are you sure?');">
                    </fieldset>
                </form>
            </div>








            <g:form resource="${this.parcours}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.parcours}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
