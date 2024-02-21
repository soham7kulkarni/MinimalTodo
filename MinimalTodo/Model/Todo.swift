//
//  Todo.swift
//  MinimalTodo
//
//  Created by csuftitan on 2/21/24.
//

import SwiftUI
import SwiftData

@Model
class Todo {
//    To update the to do state of the widgets
    private(set) var taskID: String = UUID().uuidString
    var task: String
    var isCompleted: Bool = false
    var priority: Priority = Priority.normal
    var lastUpdated: Date = Date.now
    
    init(taskID: String, task: String, isCompleted: Bool, priority: Priority) {
        self.taskID = taskID
        self.task = task
        self.isCompleted = isCompleted
        self.priority = priority
    }
}

enum Priority: String, Codable, CaseIterable {
    case normal = "Normal"
    case medium = "Medium"
    case high = "High"
    
    var color: Color {
        switch self {
        case .normal:
            return .green
        case .medium:
            return .yellow
        case .high:
            return .red
        }
    }
}
