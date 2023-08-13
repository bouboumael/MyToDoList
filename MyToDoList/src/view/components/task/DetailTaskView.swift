//
//  DetailTaskView.swift
//  MyToDoList
//
//  Created by Mael Chariault on 13/08/2023.
//

import SwiftUI

struct DetailTaskView: View {
    
    @Binding var task: Task

    var body: some View {
        VStack {
            List {
                Section(header: HeaderView(title: "Tâche")) {
                    Text(task.taskName!)
                }
                
                Section(header: HeaderView(title: "Date limite")) {
                    Text(formattedDate(from: task.deadline!))
                }

                Section(header: HeaderView(title: "Définition")) {
                    Text(task.definition!)
                }

                Section(header: HeaderView(title: "Création")) {
                    Text(formattedDate(from: task.createdAt!))
                }
            }
            .listStyle(GroupedListStyle())
            
            HStack {
                Button(action: {
                    // Action pour clore la tâche
                }) {
                    Text("Terminer la tâche")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.cyan)
                        .cornerRadius(10)
                }
                
                Spacer()
                
                Button(action: {
                    // Action pour supprimer la tâche
                }) {
                    Text("Supprimer la tâche")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Détails")
        .navigationBarTitleDisplayMode(.inline)
    }


    func formattedDate(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
    
}

struct HeaderView: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.secondary)
            .padding(.top, 10)
            .padding(.bottom, 5)
    }
}

struct DetailTaskView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let newTask = Task(context: context)
        newTask.taskName = "Example Task"
        newTask.definition = "AAAAAAAAAAA"
        newTask.deadline = Date()
        newTask.createdAt = Date()
        return DetailTaskView(task: .constant(newTask))
    }
}

