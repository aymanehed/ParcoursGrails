package com.mbds.parcours

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class SignupController {

    UserService userService
    SpringSecurityService springSecurityService
    def index() {
        // Render the registration form
        render(view: 'index')
    }
    def register() {
        // Handle the registration form submission
        def user = new User(params)
        if (user.save()) {
            // Registration successful
            flash.message = 'Registration successful!'
            def roleUser = Role.findByAuthority("ROLE_USER")
            if(!roleUser){
                roleUser = new Role(authority: "ROLE_USER").save()
            }
            UserRole.create(user, roleUser, true)
            redirect controller: "login", action: "auth" // Redirect to the login page
        } else {
            flash.message = 'Registration failed. Please try again.'
            render view: 'index' // Render the registration form again in case of errors
        }
    }
}
