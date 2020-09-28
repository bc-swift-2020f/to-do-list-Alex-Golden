//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Alex Golden on 9/27/20.
//

import Foundation

struct ToDoItem: Codable {
    var name: String
    var date: Date
    var notes: String
    var reminderSet: Bool 
   
}
