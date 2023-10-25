package mbds_emsi_23_24

import com.mbds.parcours.*

class BootStrap {

    def init = { servletContext ->

        def roleAdmin = new Role(authority: 'ROLE_ADMIN').save()
        def roleUser = new Role(authority: 'ROLE_USER').save()
        def userAdmin = new User(username: "admin", password: "admin", email: "admin@parcours.com").save()
        UserRole.create(userAdmin, roleAdmin, true)
        ["Alice","Bob","Charly","Denis","Etienne"].each {
            String uName ->
                def userInstance = new User(username: uName, password: "password", email: uName+"@parcours.com").save()
                (1..3).each {
                    Integer parcoursIdx ->
                        def parcoursInstance = new Parcours(name: "Parcours de $uName # $parcoursIdx", description: "Une description simple")
                        (1..3).each {
                            parcoursInstance.addToIllustrationList(new Illustration(name: "grails.svg"))
                        }
                        (1..5).each {
                            Integer poiIdx ->
                                def poiInstance = new POI(name: "Poi n°$poiIdx du parcours $parcoursIdx de $uName",
                                        description: "Une belle description de POI",
                                        latitude:10, longitude: 10)
                                (1..5).each {
                                    poiInstance.addToIllustrationList(new Illustration(name: "grails.svg"))
                                }
                                parcoursInstance.addToPoiList(poiInstance)
                        }

                        userInstance.addToParcoursList(parcoursInstance)
                }
                userInstance.save()
        }

    }
    def destroy = {
    }
}
