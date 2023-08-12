//
//  TodoListView.swift
//  MyToDoList
//
//  Created by Mael Chariault on 12/08/2023.
//

import SwiftUI

struct TodoListView: View {
    var body: some View {
        VStack{
            ForEach (1..<11) {_ in
                TaskView()
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
