//
//  MinimalTodoApp.swift
//  MinimalTodo
//
//  Created by csuftitan on 2/21/24.
//

import SwiftUI
import SwiftData

@main
struct MinimalTodoApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Todo.self)
    }
}
