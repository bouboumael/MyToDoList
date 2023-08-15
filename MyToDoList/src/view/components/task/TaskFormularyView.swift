import SwiftUI

struct TaskFormularyView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var taskName = ""
    @State private var deadline = Date()
    @State private var definition = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Nom de la tâche", text: $taskName)
                            .frame(height: 50)
                    }
                    
                    Section {
                        DatePicker("Date limite", selection: $deadline, displayedComponents: .date)
                            .environment(\.locale, Locale(identifier: "fr_FR"))
                            .frame(height: 50)
                    }
                    
                    Section {
                        ZStack(alignment: .topLeading) {
                            if definition.isEmpty {
                                Text("Description")
                                    .foregroundColor(Color(.placeholderText))
                                    .padding(4)
                                    .font(.body)
                            }
                            
                            TextEditor(text: $definition)
                                .frame(height: 300)
                                .textContentType(.none)
                        }
                    }
                    
                    Section {} header: {
                        Button(action: {
                            saveTask()
                        }) {
                            Text("Créer la tâche")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .navigationBarTitle("Nouvelle Tâche", displayMode: .inline)
        }
    }
    
    private func saveTask() {
        withAnimation {
            let newTask = Task(context: viewContext)
            newTask.taskName = taskName
            newTask.deadline = deadline
            newTask.definition = definition
            newTask.createdAt = Date()
            
            do {
                try viewContext.save()
                presentationMode.wrappedValue.dismiss()
            } catch {
                    // Gestion des erreurs
                let nsError = error as NSError
                fatalError("Erreur lors de l'enregistrement de la nouvelle tâche : \(nsError)")
            }
        }
    }
}


struct TaskFormularyView_Previews: PreviewProvider {
    static var previews: some View {
        TaskFormularyView()
    }
}
