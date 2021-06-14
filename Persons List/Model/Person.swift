//
//  Person.swift
//  Persons List
//
//  Created by Mac mini on 09.06.2021.
//

struct Person {
    let name: String
    let surname: String
    let mail: String
    let number: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

extension Person {
    static func getPersonList() -> [Person] {
        [
            Person(name: "Egor",
                 surname: "Chirkov",
                 mail: "egor@mail.ru",
                 number: "+79007474747"),
            Person(name: "Steven",
                 surname: "Anderson",
                 mail: "anderson@aol.com",
                 number: "+79007458965"),
            Person(name: "Brendan",
                 surname: "Reeves",
                 mail: "reeves@yandex.ru",
                 number: "+79007451275"),
            Person(name: "James",
                 surname: "Waters",
                 mail: "waters@google.com",
                 number: "+79004758569"),
            Person(name: "Grant",
                 surname: "Hess",
                 mail: "hess@ups.com",
                 number: "+79044784367"),
            Person(name: "Miller",
                 surname: "Clark",
                 mail: "clark@outlook.com",
                 number: "+79004757633"),
            Person(name: "Safaa",
                 surname: "Baird",
                 mail: "baird@live.com",
                 number: "+79021758647")
        ]
    }
}
