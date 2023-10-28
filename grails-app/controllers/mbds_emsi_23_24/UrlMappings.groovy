package mbds_emsi_23_24

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "/POI/index"(view:"/POI/index")
        "/root"(controller: "user", action: "index")
        "/parcours/List"(view:"/parcours/index")
        "/Signup/auth"(view:"/Signup/auth")
        "/login/auth"(view:"/login/auth")

        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
