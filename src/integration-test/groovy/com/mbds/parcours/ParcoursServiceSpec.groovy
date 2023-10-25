package com.mbds.parcours

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ParcoursServiceSpec extends Specification {

    ParcoursService parcoursService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Parcours(...).save(flush: true, failOnError: true)
        //new Parcours(...).save(flush: true, failOnError: true)
        //Parcours parcours = new Parcours(...).save(flush: true, failOnError: true)
        //new Parcours(...).save(flush: true, failOnError: true)
        //new Parcours(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //parcours.id
    }

    void "test get"() {
        setupData()

        expect:
        parcoursService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Parcours> parcoursList = parcoursService.list(max: 2, offset: 2)

        then:
        parcoursList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        parcoursService.count() == 5
    }

    void "test delete"() {
        Long parcoursId = setupData()

        expect:
        parcoursService.count() == 5

        when:
        parcoursService.delete(parcoursId)
        sessionFactory.currentSession.flush()

        then:
        parcoursService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Parcours parcours = new Parcours()
        parcoursService.save(parcours)

        then:
        parcours.id != null
    }
}
