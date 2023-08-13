//
//  TaskView.swift
//  MyToDoList
//
//  Created by Mael Chariault on 12/08/2023.
//

import SwiftUI

struct TaskView: View {
    var body: some View {
        HStack {
            Text("Tache")
            Spacer()
            Text("\(Date(), formatter: dateFormatter)")
            Spacer()
            Image(systemName: "chevron.right.circle")
        }
        .font(.title3)
        .padding()
        .background(.cyan)
        .cornerRadius(10.0)
        .padding(.horizontal, 30)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
