//
//  Person.swift
//  ExRefactor12_1
//
//  Created by 김종권 on 2023/07/19.
//

import Foundation

struct Person {
    let name: String
    let age: Int
    
    var isNameUnique: Bool {
        Bool.random()
    }
    
    func old(than otherAge: Int) -> Bool {
        age < otherAge
    }
}

struct User {
    let id = UUID().uuidString
    let person: Person
    
    func getPassword() -> String {
        "\(id) \(person.name)"
    }
}

extension User {
    init(name: String, age: Int) {
        self.person = .init(name: name, age: age)
    }
    
    var isNameUnique: Bool {
        person.isNameUnique
    }
    
    var name: String {
        person.name
    }
}
