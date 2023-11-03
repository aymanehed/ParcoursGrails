package com.mbds.parcours

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

import javax.annotation.security.PermitAll

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_USER'])
class ParcoursController {
    SpringSecurityService springSecurityService
    ParcoursService parcoursService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond parcoursService.list(params), model:[parcoursCount: parcoursService.count()]

    }
    def show(Long id) {
        respond parcoursService.get(id)
    }
    def create() {
     def CurrentUser=springSecurityService.currentUser
        respond new Parcours(params),model: [currentuser:CurrentUser]
    }
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
    def edit(Long id) {
        respond parcoursService.get(id)
    }
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
