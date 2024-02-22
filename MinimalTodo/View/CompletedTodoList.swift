//
//  CompletedTodoList.swift
//  MinimalTodo
//
//  Created by csuftitan on 2/21/24.
//

import SwiftUI
import SwiftData

struct CompletedTodoList: View {
    @Binding var showAll: Bool
    @Query private var completedList: [Todo]
    init(showAll: Binding<Bool>){
        let predicate  = #Predicate<Todo>  {$0.isCompleted}
        let sort = [SortDescriptor(\Todo.lastUpdated, order: .reverse)]
        
        var descriptor = FetchDescriptor(predicate: predicate, sortBy: sort)
        
        if !showAll.wrappedValue {
            descriptor.fetchLimit = 15
        }
        
        _completedList = Query(descriptor, animation: .snappy)
        _showAll = showAll
    }
    
        var body: some View {
        Section{
            ForEach(completedList) {
                TodoRowView(todo: $0)
            }
        } header: {
            HStack{
                Text ("Completed")
                Spacer(minLength: 0)
                if showAll {
                    Button("Show Recents"){
                        showAll = false
                    }
                }
            }
            .font(.caption)
            
        } footer: {
            if completedList.count == 15 && !showAll {
                HStack {
                    Text("Showing Recent 15 tasks")
                        .foregroundStyle(.gray)
                    
                    Spacer(minLength: 0)
                    
                    Button("Show All") {
                        showAll = true
                    }
                }
                .font(.caption)
            }
        }
    }
}

#Preview {
    ContentView()
}
