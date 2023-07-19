//
//  ViewController.swift
//  ExRefactor12_1
//
//  Created by 김종권 on 2023/07/19.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user1 = User(person: .init(name: "jake", age: 20))
        let isUnique = user1.person.isNameUnique
        let name = user1.person.name
        
        let user2 = User(name: "jake", age: 20)
        let isUnique2 = user2.person
        let name2 = user2.name
    }
}
