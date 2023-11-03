package mbds_emsi_23_24

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "/POI/index"(controller:"poi",action:"index")
        "/parcours/List"(controller:"parcours",action:  "index")
        "/Mesparcours"(controller:"profile",action:"MesParcours")
        "/MesPOI"(controller:"profile",action:"MesPois")
         "/root"(controller:"user",action:"index")
        "/profile"(controller: "profile", action:"index")
        "/profile/edit"(controller: "profile", action:"edit")
        "/Signup"(controller: "signup", action:"index")
        "/home"(controller: "user", action:"home")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
