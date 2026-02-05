//
//  ListViewModel.swift
//  WeatherApp
//
//  Created by rentamac on 1/28/26.
//

import Foundation
import CoreData
import Combine


class ListViewModel: ObservableObject {

    @Published var savedWeather: [CityWeather] = []

    func fetchWeather(context: NSManagedObjectContext) {
        let request: NSFetchRequest<CityWeather> = CityWeather.fetchRequest()
        savedWeather = (try? context.fetch(request)) ?? []
    }

    func weather(for city: String) -> CityWeather? {
        savedWeather.first { $0.cityName == city }
    }
    
    func addLocation(_ location: Location) {

        if !locations.contains(where: { $0.name == location.name }) {
            locations.append(location)
        }

    }

    
    func deleteWeather(
        city: String,
        context: NSManagedObjectContext
    ) {

        let request: NSFetchRequest<CityWeather> =
            CityWeather.fetchRequest()

        request.predicate =
            NSPredicate(format: "cityName == %@", city)

        if let result = try? context.fetch(request).first {

            context.delete(result)
            try? context.save()

            fetchWeather(context: context)

        }

    }

    
    func deleteLocation(city: String) {

        locations.removeAll {
            $0.name == city
        }

    }
    
    func clearAllWeather(context: NSManagedObjectContext) {

            let request: NSFetchRequest<NSFetchRequestResult> =
                CityWeather.fetchRequest()

            let deleteRequest =
                NSBatchDeleteRequest(fetchRequest: request)

            try? context.execute(deleteRequest)

            fetchWeather(context: context)

        }


    
        func clearAllLocations() {

            locations.removeAll()

        }


}
