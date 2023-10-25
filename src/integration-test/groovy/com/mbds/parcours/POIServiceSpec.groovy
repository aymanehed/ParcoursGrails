package com.mbds.parcours

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class POIServiceSpec extends Specification {

    POIService POIService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new POI(...).save(flush: true, failOnError: true)
        //new POI(...).save(flush: true, failOnError: true)
        //POI POI = new POI(...).save(flush: true, failOnError: true)
        //new POI(...).save(flush: true, failOnError: true)
        //new POI(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //POI.id
    }

    void "test get"() {
        setupData()

        expect:
        POIService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<POI> POIList = POIService.list(max: 2, offset: 2)

        then:
        POIList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        POIService.count() == 5
    }

    void "test delete"() {
        Long POIId = setupData()

        expect:
        POIService.count() == 5

        when:
        POIService.delete(POIId)
        sessionFactory.currentSession.flush()

        then:
        POIService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        POI POI = new POI()
        POIService.save(POI)

        then:
        POI.id != null
    }
}
