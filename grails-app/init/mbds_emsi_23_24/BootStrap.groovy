package mbds_emsi_23_24

import com.mbds.parcours.*

class BootStrap {

    def init = { servletContext ->
        // Création de deux role, Admin et User
        def roleAdmin = new Role(authority: 'ROLE_ADMIN').save()
        def roleUser = new Role(authority: 'ROLE_USER').save()

        // Création du compte administrateur
        def userAdmin = new User(username: "admin", password: "admin", email: "admin@parcours.com").save()
        // Association du compte administrateur avec le role admin
        UserRole.create(userAdmin, roleAdmin, true)

        // On itère sur 5 username pour créer 5 utilisateurs
        ["Alice","Bob","Charly","Denis","Etienne"].each {
            String uName ->
                // Création de la nouvelle instance d'utilisateur
                def userInstance = new User(username: uName, password: "password", email: uName+"@parcours.com").save()
                // Pour chaque utilisateur on ajoute 3 parcours
                (1..3).each {
                    Integer parcoursIdx ->
                        // Création de la nouvelle instance de parcours
                        def parcoursInstance = new Parcours(name: "Parcours de $uName # $parcoursIdx", description: "Une description simple")
                        // Pour chaque parcours on crée 3 illustrations
                        (1..3).each {
                            parcoursInstance.addToIllustrationList(new Illustration(name: "grails.svg"))
                        }
                        // Pour chaque parcours on ajoute 5 pois
                        (1..5).each {
                            Integer poiIdx ->
                                // Création de la nouvelle instance de POI
                                def poiInstance = new POI(name: "Poi n°$poiIdx du parcours $parcoursIdx de $uName",
                                        description: "Une belle description de POI",
                                        latitude:10, longitude: 10)
                                // Pour chaque POI on ajoute 5 illustrations
                                (1..5).each {
                                    poiInstance.addToIllustrationList(new Illustration(name: "grails.svg"))
                                }
                                // On ajoute l'instance de POI au parcours
                                parcoursInstance.addToPoiList(poiInstance)
                        }
                        // On ajoute l'instance du parcours à l'utilisateur
                        userInstance.addToParcoursList(parcoursInstance)
                }
                /**
                 * -> Save l'utilisateur
                 *      -> Save les parcours
                 *          -> Save les Pois
                 *              -> Save les Illustrations de POI
                 *          -> Save les Illustrations de parcours
                 */
                userInstance.save(flush: true, failOnError: true)
        }

    }
    def destroy = {
    }
}
