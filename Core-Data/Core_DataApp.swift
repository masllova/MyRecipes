//
//  Core_DataApp.swift
//  Core-Data
//
//  Created by Александра Маслова on 10.02.2023.
//

import SwiftUI

@main
struct Core_DataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
