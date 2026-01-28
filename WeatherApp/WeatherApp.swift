//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import SwiftUI
import CoreData

@main
struct WeatherApp: App {

    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(
                    \.managedObjectContext,
                    persistenceController.container.viewContext
                )
        }
    }
}

