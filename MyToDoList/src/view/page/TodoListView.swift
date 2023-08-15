//
//  TodoListView.swift
//  MyToDoList
//
//  Created by Mael Chariault on 12/08/2023.
//

import SwiftUI

struct TodoListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.objectID, ascending: true)],
        animation: .default)
    private var tasks: FetchedResults<Task>
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Mes tâches en cours")
                    .font(.title)
                    .padding()
                ForEach (tasks) {task in
                    TaskView(task: task)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    TaskFormularyView()
                } label: {
                    Label("Add Item", systemImage: "plus")
                    
                }
            }
        }
        .navigationTitle("Tâches")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
