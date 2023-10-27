package com.mbds.parcours

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

import javax.annotation.security.PermitAll

import static org.springframework.http.HttpStatus.*


class ParcoursController {

    ParcoursService parcoursService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    @Secured('permitAll')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond parcoursService.list(params), model:[parcoursCount: parcoursService.count()]
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def show(Long id) {
        respond parcoursService.get(id)
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def create() {
        respond new Parcours(params)
    }
    @Secured('ROLE_ADMIN')
    def save(Parcours parcours) {
        if (parcours == null) {
            notFound()
            return
        }

        try {
            parcoursService.save(parcours)
        } catch (ValidationException e) {
            respond parcours.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'parcours.label', default: 'Parcours'), parcours.id])
                redirect parcours
            }
            '*' { respond parcours, [status: CREATED] }
        }
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def edit(Long id) {
        respond parcoursService.get(id)
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def update(Parcours parcours) {
        if (parcours == null) {
            notFound()
            return
        }

        try {
            parcoursService.save(parcours)
        } catch (ValidationException e) {
            respond parcours.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'parcours.label', default: 'Parcours'), parcours.id])
                redirect parcours
            }
            '*'{ respond parcours, [status: OK] }
        }
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        parcoursService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'parcours.label', default: 'Parcours'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'parcours.label', default: 'Parcours'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
