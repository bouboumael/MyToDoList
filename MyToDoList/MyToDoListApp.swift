//
//  MyToDoListApp.swift
//  MyToDoList
//
//  Created by Mael Chariault on 12/08/2023.
//

import SwiftUI

@main
struct MyToDoListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(.light)
        }
    }
}
