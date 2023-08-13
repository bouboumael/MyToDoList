//
//  TodoListView.swift
//  MyToDoList
//
//  Created by Mael Chariault on 12/08/2023.
//

import SwiftUI

struct TodoListView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Mes taches en cours")
                    .font(.title)
                    .padding()
                ForEach (1..<11) {_ in
                    TaskView()
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    //
                } label: {
                    Label("Add Item", systemImage: "plus")
                    
                }
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
