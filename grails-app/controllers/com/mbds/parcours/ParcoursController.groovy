package com.mbds.parcours

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import org.springframework.beans.factory.annotation.Autowired

import javax.annotation.security.PermitAll

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_USER','ROLE_MODERATOR'])
class ParcoursController {
    SpringSecurityService springSecurityService
    ParcoursService parcoursService
    UserService userService
    UserController userController
    static allowedMethods = [save: "POST", delete: "DELETE"]
    def index(Integer max) {
        def CurrentUser=springSecurityService.currentUser
        params.max = Math.min(max ?: 10, 100)
        respond parcoursService.list(params), model:[parcoursCount: parcoursService.count(),currentuser:CurrentUser]

    }
    def show(Long id) {
        def CurrentUser=springSecurityService.currentUser
        respond parcoursService.get(id) ,model:[currentuser:CurrentUser]
    }
    def create() {
     def CurrentUser=springSecurityService.currentUser
        //print(parcoursService.count())

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
                flash.message = "Parcours created"
                redirect parcours
            }
            '*' { respond parcours, [status: CREATED] }
        }
    }
    def edit(Long id) {
        def CurrentUser=springSecurityService.currentUser
        def parcours = parcoursService.get(id)
        //print(parcours)
        respond parcoursService.get(id),model: [currentuser:CurrentUser,userList: userService.list(params),Currentparcours:parcours]
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
                flash.message = "Parcours Updated"
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
                flash.message ="Parcours Deleted"
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
