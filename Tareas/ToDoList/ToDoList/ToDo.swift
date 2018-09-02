//
//  ToDo.swift
//  ToDoList
//
//  Created by José Gil Ramírez S on 31/08/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import UIKit

struct ToDo {
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static func loadToDos() -> [ToDo]? {
        return nil
    }
    
    static func loadSampleToDos() -> [ToDo] {
        let todo1 = ToDo(title: "Tarea 1", isComplete: false, dueDate: Date(), notes: "Realizar las actividades")
        let todo2 = ToDo(title: "Tarea 2", isComplete: false, dueDate: Date(), notes: "Realizar las actividades")
        let todo3 = ToDo(title: "Tarea 3", isComplete: true, dueDate: Date(), notes: "Realizar las actividades")
        let todo4 = ToDo(title: "Tarea 4", isComplete: false, dueDate: Date(), notes: "Realizar las actividades")
        
        return [todo1, todo2, todo3, todo4]
    }
}


