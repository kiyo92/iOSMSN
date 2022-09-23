//
//  ViewController.swift
//  iOSMSN
//
//  Created by Joao Marcus Dionisio Araujo on 22/09/22.
//

import UIKit
import Firebase
import FirebaseDatabase
class ViewController: UIViewController {
    var messageList: [Message] = []
    var refChat: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()

        refChat = Database.database().reference().child("chat");

        refChat?.observe(.value, with: { snapshot in
            var newLists: [Message] = []

            for child in snapshot.children {
                
                if let snapshot = child as? DataSnapshot,
                   let newToDo = Message(snapshot: snapshot) {
                    newLists.append(newToDo)
                }
            }
            self.messageList = newLists
            print(self.messageList)
        })
        addPressed()
    }

    func addPressed() {
        let list = Message(name: "Kiyo", message: "Bem vindo")
        let listRef = self.refChat?.child("kiyo")
        listRef?.setValue(list.toAnyObject())
    }

}

