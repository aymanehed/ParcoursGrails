package com.mbds.parcours

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_USER'])
class IllustrationController {

    IllustrationService illustrationService

    static allowedMethods = [save: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond illustrationService.list(params), model:[illustrationCount: illustrationService.count()]
    }

    def show(Long id) {
        respond illustrationService.get(id)
    }

    def create() {
        respond new Illustration(params)
    }

    def save(Illustration illustration) {
        if (illustration == null) {
            notFound()
            return
        }

        try {
            def fileData = request.getFile("file")
            if(fileData){
                def savedPath = new File("C:\\Users\\lenovo\\Desktop\\grails_emsi_mbds_23_24\\grails-app\\assets\\images\${fileData.originalFilename}")
                def savedFile = new File(savedPath as String)
                fileData.transferTo(savedFile)
                illustration.name = fileData.originalFilename
            }
            illustrationService.save(illustration)
        } catch (ValidationException e) {
            respond illustration.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = "Illustration created"
              redirect illustration
            }
            '*' { respond illustration, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond illustrationService.get(id)
    }

    def update(Illustration illustration) {
        if (illustration == null) {
            notFound()
            return
        }

        try {
            def fileData = request.getFile("file")
            if(fileData){
                def savedPath = new File("C:\\Users\\lenovo\\Desktop\\grails-framework-heddad-aymane-khafife-jad\\grails-app\\assets\\images\\${fileData.originalFilename}")

                def savedFile = new File(savedPath as String)
                fileData.transferTo(savedFile)
                illustration.name = fileData.originalFilename
            }

            illustrationService.save(illustration)
        } catch (ValidationException e) {
            respond illustration.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = "Illustration Updated"
                redirect illustration
            }
            '*'{ respond illustration, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        illustrationService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = "Illustration Updated"
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = "Illustration Deleted"
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
