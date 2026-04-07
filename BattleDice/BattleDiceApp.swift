//
//  BattleDiceApp.swift
//  BattleDice
//
//  Created by Renan Baialuna on 27/02/26.
//

import SwiftUI
import CoreData

@main
struct BattleDiceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            AppCoordinatorView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
