//
//  DetailViewModel.swift
//  WeatherApp
//
//  Created by rentamac on 1/27/26.
//

import SwiftUI
import Combine

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

    func fetchWeather(latitude: Double, longitude: Double) async {
        do {
            let response = try await weatherService.fetchWeather(
                latitude: latitude,
                longitude: longitude
            )

            let temp = response.current.temperature2M
            temperatureText = "\(temp) °C"
            iconName = getWeatherIcon(from: temp)

        } catch {
            temperatureText = "Unable to load"
            iconName = "exclamationmark.triangle.fill"
        }
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
