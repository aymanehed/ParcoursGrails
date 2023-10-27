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
         "/root"(controller:"user",action:"index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
