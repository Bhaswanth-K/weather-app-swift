//
//  DetailViewModel.swift
//  WeatherApp
//
//  Created by rentamac on 1/27/26.
//

import SwiftUI
import Combine
import CoreData


@MainActor
class DetailViewModel: ObservableObject {

    @Published var temperatureText: String = "Loading..."
    @Published var iconName: String = "cloud.fill"

    private let weatherService: WeatherServiceProtocol

    init(
        weatherService: WeatherServiceProtocol = WeatherService(
            networkService: HttpNetworking()
        )
    ) {
        self.weatherService = weatherService
    }

    func fetchWeather(
        latitude: Double,
        longitude: Double,
        cityName: String,
        context: NSManagedObjectContext
    ) async {
        do {
            let response = try await weatherService.fetchWeather(
                latitude: latitude,
                longitude: longitude
            )

            let temp = response.current.temperature2M
            let icon = getWeatherIcon(from: temp)

            temperatureText = "\(temp) °C"
            iconName = icon

            saveWeather(
                city: cityName,
                temperature: temp,
                icon: icon,
                context: context
            )

        } catch {
            temperatureText = "Unable to load"
        }
    }

    
    private func saveWeather(
        city: String,
        temperature: Double,
        icon: String,
        context: NSManagedObjectContext
    ) {
        let weather = CityWeather(context: context)
        weather.cityName = city
        weather.temperature = temperature
        weather.iconName = icon

        try? context.save()
    }


    private func getWeatherIcon(from temperature: Double) -> String {
        if temperature >= 30 {
            return Weather.sunny.icon
        } else if temperature >= 20 {
            return Weather.cloudy.icon
        } else if temperature >= 10 {
            return Weather.rainy.icon
        } else {
            return Weather.snowy.icon
        }
    }
}
