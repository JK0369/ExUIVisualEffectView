//
//  ViewController.swift
//  ExCrash
//
//  Created by 김종권 on 2023/08/26.
//

import UIKit

struct Person: Codable {
    let name: String
    let age: Int
    let isStudent: Bool
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /// 크레시 발생 케이스 (jsonData를 넣지 않은 경우)
        let personObject = Person(name: "jake", age: 1, isStudent: false)
        if let jsonData3 = try? JSONSerialization.data(withJSONObject: personObject) {
            print("jsonData3>", jsonData3)
        } else {
            print("failed, jsonData3")
        }

        /// JSONEncoder를 사용하는것을 권장
        let jsonEncoder = JSONEncoder()
        try! jsonEncoder.encode(personObject)
        
    }
}
