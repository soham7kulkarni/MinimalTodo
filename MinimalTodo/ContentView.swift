//
//  ContentView.swift
//  MinimalTodo
//
//  Created by csuftitan on 2/21/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationStack{
            Home()
                .navigationTitle("Todo List")
        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
