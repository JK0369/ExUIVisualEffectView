import UIKit

struct Person: Codable {
    let name: String
    let age: Int
    let isStudent: Bool
}

// 서버로 부터 json 스트링 내려왔다고 가정
let jsonString = """
{
    "name": "jake",
    "age": 30,
    "isStudent": false
}
"""

// ex1 - JSONDecoder를 사용하여 person으로 변경
// 1. 스트링을 data로 변환
let jsonData = jsonString.data(using: .utf8)!

// 2. data를 struct로 변환
let decoder = JSONDecoder()
let person = try? decoder.decode(Person.self, from: jsonData)
print(person!)
/*
 Person(name: "jake", age: 30, isStudent: false)
*/


// ex2 - JSONSerialization를 사용하여 person으로 변경
let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
let name = jsonObject["name"] as! String
let age = jsonObject["age"] as! Int
let isStudent = jsonObject["isStudent"] as! Bool

let newPerson = Person(name: name, age: age, isStudent: isStudent)
print(newPerson)
/*
 Person(name: "jake", age: 30, isStudent: false)
*/

// ex3 - jsonData가 아닌 것을 JSONSerialization하면 크래시 발생
/// 정상 케이스
let newJsonObject = try! JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
let newJsonData = try! JSONSerialization.data(withJSONObject: newJsonObject)
print(jsonData) // 61 bytes

/// 크레시 발생 케이스 (jsonData를 넣지 않은 경우)
let personObject = Person(name: "jake", age: 1, isStudent: false)
if let jsonData3 = try? JSONSerialization.data(withJSONObject: personObject) {
    print("jsonData3>", jsonData3)
} else {
    print("failed, jsonData3")
}
