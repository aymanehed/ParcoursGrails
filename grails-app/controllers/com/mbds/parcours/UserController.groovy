package com.mbds.parcours

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_USER'])
class UserController {

    UserService userService

    static allowedMethods = [save: "POST", delete: "DELETE"]
    @Secured('ROLE_ADMIN')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond userService.list(params), model:[userCount: userService.count()]
    }


    def show(Long id) {
        respond userService.get(id)
    }

    def home() {
        render(view: 'home')

    }
    @Secured('permitAll')
    def create() {
        respond new User(params)
    }

    @Secured('permitAll')
    def save(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {

            userService.save(user)

            def roleUser = Role.findByAuthority("ROLE_USER")
            if(!roleUser){
                roleUser = new Role(authority: "ROLE_USER").save()
            }
            UserRole.create(user, roleUser, true)


        } catch (ValidationException e) {
            respond user.errors, view:'create'
            return
        }
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                 if (user.authorities.contains(Role.findByAuthority("ROLE_ADMIN")))
                    redirect(uri: "/root")
              else
                        redirect(uri: "/home")
            }
            '*' { respond user, [status: CREATED] }
            }
        }




    def edit(Long id) {
        respond userService.get(id)
    }

    def update(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            // Récupérer le fichier dans les données
            // Sauvegarder le fichier sur le disque
            // Création d'une illustration sur le fichier sauvegardé
            // Ajout de l'illustration à l'utilisateur
            def fileData = request.getFile("file")
            if(fileData){
                def savedPath = new File("C:\\Users\\lenovo\\Desktop\\grails-framework-heddad-aymane-khafife-jad\\grails-app\\assets\\images\\${fileData.originalFilename}")

                def savedFile = new File(savedPath as String)
                fileData.transferTo(savedFile)

                def illustration = new Illustration()
                illustration.name = fileData.originalFilename
                illustration.save(flush: true)
                user.thumbnail = illustration
            }

            userService.save(user)

            // Gestion de l'attribution de role
            def roleInstance = Role.get(params.role)
            def userRoles = user.getAuthorities()
            if ( !userRoles.contains(roleInstance))
                UserRole.create(user, roleInstance, true)

        } catch (ValidationException e) {
            respond user.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }
        UserRole.findByUser(userService.get(id)).delete(flush:true)
        userService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def deleteThumb(User userInstance){
        if (userInstance)
        {
            userInstance.thumbnail = null;
            userInstance.save(flush: true)
        }

        redirect(action: "edit", id: userInstance.id)
    }

}
