package com.mbds.parcours

class POI {
    String name
    String description
    Float latitude
    Float longitude

    static belongsTo = [parcours: Parcours]

    static hasMany = [illustrationList: Illustration]

    static constraints = {
        name blank: false, nullable: false
        description blank: false, nullable: false
        latitude nullable: true
        longitude nullable: true
        parcours nullable: false
    }

    static mapping = {
        description type: 'text'
    }
}
