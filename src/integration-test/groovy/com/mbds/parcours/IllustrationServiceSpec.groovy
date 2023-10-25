package com.mbds.parcours

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class IllustrationServiceSpec extends Specification {

    IllustrationService illustrationService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Illustration(...).save(flush: true, failOnError: true)
        //new Illustration(...).save(flush: true, failOnError: true)
        //Illustration illustration = new Illustration(...).save(flush: true, failOnError: true)
        //new Illustration(...).save(flush: true, failOnError: true)
        //new Illustration(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //illustration.id
    }

    void "test get"() {
        setupData()

        expect:
        illustrationService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Illustration> illustrationList = illustrationService.list(max: 2, offset: 2)

        then:
        illustrationList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        illustrationService.count() == 5
    }

    void "test delete"() {
        Long illustrationId = setupData()

        expect:
        illustrationService.count() == 5

        when:
        illustrationService.delete(illustrationId)
        sessionFactory.currentSession.flush()

        then:
        illustrationService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Illustration illustration = new Illustration()
        illustrationService.save(illustration)

        then:
        illustration.id != null
    }
}
