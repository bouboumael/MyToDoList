import SwiftUI

struct TaskFormularyView: View {
    @State private var taskName = ""
    @State private var deadline = Date()
    @State private var definition = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Nouvelle Tâche")) {
                        TextField("Nom de la tâche", text: $taskName)
                        DatePicker("Date limite", selection: $deadline, displayedComponents: .date)
                        TextEditor(text: $definition)
                            .frame(height: 100)
                            .border(Color.gray, width: 1)
                    }
                    
                    Section {
                        Button(action: {
                                // Action pour créer la tâche
                        }) {
                            Text("Créer la tâche")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .navigationBarTitle("Nouvelle Tâche", displayMode: .inline)
        }
    }
}

struct TaskFormularyView_Previews: PreviewProvider {
    static var previews: some View {
        TaskFormularyView()
    }
}
