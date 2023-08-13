//
//  TaskView.swift
//  MyToDoList
//
//  Created by Mael Chariault on 12/08/2023.
//
import SwiftUI

struct TaskView: View {
    
    @State var task: Task
    
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationLink {
            DetailTaskView(task: $task)
        } label: {
            HStack(alignment: .firstTextBaseline) {
                Text(task.taskName!)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .frame(width: screenWidth * 0.4, alignment: .leading)
                Text(formattedDate(from: task.deadline!))
                    .font(.system(size: 14))
                Spacer()
                Image(systemName: "chevron.right.circle")
            }
            .font(.title3)
            .padding()
            .background(.cyan)
            .cornerRadius(10.0)
            .padding(.horizontal, 30)
        }
        .foregroundColor(.primary)
    }
    
    func formattedDate(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let newTask = Task(context: context)
        newTask.taskName = "Example Task"
        newTask.definition = "AAAAAAAAAAA"
        newTask.deadline = Date()
        newTask.createdAt = Date()
        return TaskView(task: newTask)
    }
}
