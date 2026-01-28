//
//  PersistenceController.swift
//  WeatherApp
//
//  Created by rentamac on 1/28/26.
//
import CoreData

struct PersistenceController {

    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "WeatherAppModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data error: \(error)")
            }
        }
    }
}

