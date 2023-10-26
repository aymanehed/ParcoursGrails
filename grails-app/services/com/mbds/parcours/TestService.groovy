package com.mbds.parcours


class TestService {
    def test() {
        long timer = System.currentTimeMillis()
        (1..10000).each {
            new Fakeclass(prop: "lala").save()
        }
        println(System.currentTimeMillis() - timer)
        timer = System.currentTimeMillis()
        (1..10000).each {
            new Fakeclass(prop: "lala").save(flush:true)
        }
        println(System.currentTimeMillis() - timer)
    }
}
