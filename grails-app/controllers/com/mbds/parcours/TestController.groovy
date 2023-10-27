package com.mbds.parcours

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_USER'])
class TestController {
    def testService

    def test() {
        testService.test()
        render "ok"
    }
}
