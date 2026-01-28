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
}
