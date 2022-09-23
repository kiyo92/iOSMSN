//
//  Message.swift
//  iOSMSN
//
//  Created by Joao Marcus Dionisio Araujo on 22/09/22.
//

import Foundation
import Firebase
import FirebaseDatabase
struct Message {
    let ref: DatabaseReference?
    var name: String
    let message: String

    init(name: String, message: String){
        self.ref = nil
        self.name = name
        self.message = message
    }

    init?(snapshot: DataSnapshot){
        guard
        let value = snapshot.value as? [String:AnyObject],
        let name = value["name"] as? String,
        let message = value["message"] as? String
        else {
            return nil
        }
        self.ref = snapshot.ref
        self.name = name
        self.message = message
    }

    func toAnyObject() -> Any {
        return [
            "name": name,
            "message":message
        ]
    }
}
