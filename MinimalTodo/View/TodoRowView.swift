//
//  TodoRowView.swift
//  MinimalTodo
//
//  Created by csuftitan on 2/21/24.
//

import SwiftUI

struct TodoRowView: View {
    @Bindable var todo: Todo
    @FocusState private var isActive: Bool
    @Environment (\.modelContext) private var context
    
    var body: some View {
        HStack(spacing: 0) {
            if !isActive && !todo.task.isEmpty {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: todo.isCompleted ? "checkmark.circle.fill": "circle")
                        .font(.title2)
                        .padding(3)
                        .contentShape(.rect)
                        .foregroundStyle(todo.isCompleted ? .gray : .primary)
                        .contentTransition(.symbolEffect(.replace))
                })
            }
            
            TextField("Record Lecture", text: $todo.task)
                .strikethrough(todo.isCompleted)
                .foregroundStyle(todo.isCompleted ? .gray : .primary)
                .focused($isActive)
            
            if !isActive && !todo.task.isEmpty {
                
                Menu {
                    ForEach(Priority.allCases, id: \.rawValue) { priority in
                        Button(action: { todo.priority = priority}, label: {
                            HStack {
                                Text(priority.rawValue)
                                
                                if todo.priority == priority { Image(systemName: "checkmark") }
                            }
                        })
                    }
                } label : {
                    Image(systemName: "circle.fill")
                        .font(.title2)
                        .padding(3)
                        .contentShape(.rect)
                        .foregroundStyle(todo.priority.color.gradient)
                }
            }
        }
        .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
        .animation(.snappy, value: isActive)
        .onAppear{
            isActive = todo.task.isEmpty
        }
        .onSubmit(of: .text) {
            if todo.task.isEmpty {
                context.delete(todo)
            }
        }
    }
}

#Preview {
    ContentView()
}
