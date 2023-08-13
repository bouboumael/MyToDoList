import SwiftUI

struct DetailTaskView: View {
    
    @Binding var task: Task

    var body: some View {
        VStack {
            List {
                Section(header: HeaderView(title: "Tâche")) {
                    Text(task.taskName!.capitalized)
                }
                
                Section(header: HeaderView(title: "Date limite")) {
                    Text(formattedDate(from: task.deadline!))
                }
                
                Section(header: HeaderView(title: "Description")) {
                    Text(task.definition!.capitalized)
                }
                
                Section(header: HeaderView(title: "Date de Création")) {
                    Text(formattedDate(from: task.createdAt!))
                }
                
                Section(header: HeaderActionView()) {}
            }
            .listStyle(GroupedListStyle())
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .navigationTitle("Détails")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    //
                } label: {
                    Label("Add Item", systemImage: "square.and.pencil")
                }
            }
        }
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

struct HeaderActionView: View {
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                // Action pour clore la tâche
            }) {
                Text("Clôturer")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.cyan)
                    .cornerRadius(10)
            }
            
            Spacer().frame(width: 20)
            
            Button(action: {
                // Action pour supprimer la tâche
            }) {
                Text("Supprimer")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
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
