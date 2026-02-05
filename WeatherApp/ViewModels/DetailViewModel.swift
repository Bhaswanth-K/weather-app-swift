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
    @Published var windText: String = ""
    @Published var windSpeed = ""
    @Published var humidity = ""
    @Published var sourceText = ""
    @Published var sourceColor: Color = .green



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
            let wind = response.current.windSpeed
            let hum = response.current.relativeHumidity

            temperatureText = "\(temp)°C"
            windSpeed = "\(wind)"
            humidity = "\(hum)"

            sourceText = "Live"
            sourceColor = .green

            saveWeather(
                city: cityName,
                temperature: temp,
                wind: wind,
                humidity: hum,
                context: context
            )

        }
        catch {

            if let saved = fetchSaved(city: cityName, context: context) {

                temperatureText = "\(saved.temperature)°C"
                windSpeed = "\(saved.windSpeed)"
                humidity = "\(saved.humidity)"

                sourceText = "Saved"
                sourceColor = .orange

            }

        }

    }


    
    private func saveWeather(
        city: String,
        temperature: Double,
        wind: Double,
        humidity: Double,
        context: NSManagedObjectContext
    ) {

        let weather = CityWeather(context: context)

        weather.cityName = city
        weather.temperature = temperature
        weather.windSpeed = wind
        weather.humidity = humidity

       
        weather.iconName = getWeatherIcon(from: temperature)

        weather.isLive = true

        try? context.save()

    }

    
    
    
    private func fetchSaved(
        city: String,
        context: NSManagedObjectContext
    ) -> CityWeather? {

        let request: NSFetchRequest<CityWeather> = CityWeather.fetchRequest()

        request.predicate = NSPredicate(
            format: "cityName == %@", city
        )

        return try? context.fetch(request).first

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
