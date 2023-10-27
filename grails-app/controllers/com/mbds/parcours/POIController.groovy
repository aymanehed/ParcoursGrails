package com.mbds.parcours

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_USER'])
class POIController {

    POIService POIService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    @Secured(['permitAll'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond POIService.list(params), model:[POICount: POIService.count()]
    }

    def show(Long id) {
        respond POIService.get(id)
    }

    def create() {
        respond new POI(params)
    }

    def save(POI POI) {
        if (POI == null) {
            notFound()
            return
        }

        try {
            POIService.save(POI)
        } catch (ValidationException e) {
            respond POI.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'POI.label', default: 'POI'), POI.id])
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
            POIService.save(POI)
        } catch (ValidationException e) {
            respond POI.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'POI.label', default: 'POI'), POI.id])
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
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'POI.label', default: 'POI'), id])
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
