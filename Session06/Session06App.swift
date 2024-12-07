//
//  Session06App.swift
//  Session06
//
//  Created by DAMII on 3/12/24.
//

import SwiftUI

@main
struct Session06App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
