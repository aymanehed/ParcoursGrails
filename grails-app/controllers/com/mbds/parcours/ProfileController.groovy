package com.mbds.parcours

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.OK

@Secured(['ROLE_ADMIN','ROLE_USER'])
class ProfileController {
    SpringSecurityService springSecurityService
    UserService userService
    ParcoursService parcoursService

    static allowedMethods = [save: "POST", delete: "DELETE"]



    // return the current user's profile
    def index() {
        def currentUserID = springSecurityService.principal.id as Long
        //return the current user's profile
        def currentUser = userService.get(currentUserID)

        print(currentUser.thumbnail)
        render(view: 'index', model: [currentUser: currentUser])

    }


    // edit the current user's profile
    def edit() {
        def currentUserID = springSecurityService.principal.id as Long
        //return the current user's profile
        def currentUser = userService.get(currentUserID)


        print(currentUser.thumbnail)
        render(view: 'edit', model: [user: currentUser])

    }

    // update the current user's profile and redirect him to to the index
    def update(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            def fileData = request.getFile("file")
            if(fileData!= null && ! fileData.isEmpty()) {
                def savedPath = new File("C:\\Users\\lenovo\\Desktop\\grails_emsi_mbds_23_24\\grails-app\\assets\\images\${fileData.originalFilename}")

                def savedFile = new File(savedPath as String)
                fileData.transferTo(savedFile)

                def illustration = new Illustration()
                illustration.name = fileData.originalFilename
                illustration.save(flush: true)
                user.thumbnail = illustration
            }
            userService.save(user)
            def roleUser = Role.findByAuthority("ROLE_USER")
            if(!roleUser){
                roleUser = new Role(authority: "ROLE_USER").save()
            }
            UserRole.create(user, roleUser, true)
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



def MesParcours(){
    def currentUserID = springSecurityService.principal.id as Long
    //return the current user's profile
    def currentUser = userService.get(currentUserID)
    def parcours = currentUser.parcoursList
    print(parcours)
    render(view: 'MesParcours', model: [parcours: parcours,parcoursCount: parcoursService.count()])
}

    def MesPois(){
        def currentUserID = springSecurityService.principal.id as Long
        //return the current user's profile
        def currentUser = userService.get(currentUserID)
        def parcours = currentUser.parcoursList
        def poi = currentUser.parcoursList.poiList
        print(poi)
        render(view: 'MesPois', model: [poi: poi,parcours: parcours])
    }





}
