package com.mbds.parcours

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_USER'])
class POIController {
    ParcoursService parcoursService
    POIService POIService
    UserService UserService
    SpringSecurityService springSecurityService
    static allowedMethods = [save: "POST", delete: "DELETE"]
    @Secured(['permitAll'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond POIService.list(params), model:[POICount: POIService.count()]
    }


    def show(Long id) {
        def poiInstance = POIService.get(id)
        if(!poiInstance){
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'POI.label', default: 'POI'), id])
            redirect action: "index"
            return
        }
        [POI: poiInstance, latitude: poiInstance.latitude, longitude: poiInstance.longitude]
    }

    def create() {
        def currentUserID = springSecurityService.principal.id as Long
        // Récupérer l'utilisateur courant
        def currentUser = UserService.get(currentUserID)
        // Récupérer tous les parcours associés à l'utilisateur courant
        def parcoursList = Parcours.findAllByAuthor(currentUser)

        respond new POI(params), model:[parcoursListUser: parcoursList,parcoursListAdmin: parcoursService.list()]
    }

    def save(POI POI) {
        if (POI == null) {
            notFound()
            return
        }

        try {
            print(POI.latitude + " " + POI.longitude)
            POIService.save(POI)

        } catch (ValidationException e) {
            respond POI.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = "POI Created"
                redirect POI
            }
            '*' { respond POI, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond POIService.get(id)
    }

    def update(POI POI) {
        if (POI == null) {
            notFound()
            return
        }
        try {
            POI.illustrationList*.id

            POIService.save(POI)
        } catch (ValidationException e) {
            respond POI.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = "POI Updated"
                redirect POI
            }
            '*'{ respond POI, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        POIService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = "POI Deleted"
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'POI.label', default: 'POI'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}