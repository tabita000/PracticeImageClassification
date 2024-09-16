//
//  PracticeImageClassificationApp.swift
//  PracticeImageClassification
//
//  Created by Tabita Sadiq on 9/15/24.
//

import SwiftUI

@main
struct PracticeImageClassificationApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
