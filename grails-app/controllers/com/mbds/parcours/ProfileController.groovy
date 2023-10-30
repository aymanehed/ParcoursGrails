package com.mbds.parcours

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.OK

@Secured('permitAll')
class ProfileController {
    SpringSecurityService springSecurityService
    UserService UserService

    static allowedMethods = [save: "POST", delete: "DELETE"]



    // return the current user's profile
    def index() {
        def currentUserID = springSecurityService.principal.id as Long
        //return the current user's profile
        def currentUser = UserService.get(currentUserID)

        print(currentUser)
        render(view: 'index', model: [currentUser: currentUser])

    }


    // edit the current user's profile
    def edit() {
        def currentUserID = springSecurityService.principal.id as Long
        //return the current user's profile
        def currentUser = UserService.get(currentUserID)

        print(currentUser)
        render(view: 'edit', model: [user: currentUser])

    }

    // update the current user's profile and redirect him to to the index
    def update(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            UserService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(default: 'User'), user.id])
                redirect(action: "index")
            }
            '*' { respond user, [status: OK] }
        }
    }








}
