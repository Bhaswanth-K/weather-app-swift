//
//  DetailScreen.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import SwiftUI

struct DetailScreen: View {

    let location: Location

    @State private var temperatureText: String = "Loading..."
    @State private var iconName: String = "cloud.fill"

    private let weatherService = WeatherService(
        networkService: HttpNetworking()
    )

    var body: some View {
        VStack(spacing: 20) {

            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            Image(systemName: iconName)
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)

            Text(temperatureText)
                .font(.title)

        }
        .task {
            await fetchWeather()
        }
    }

    private func fetchWeather() async {
        do {
            let response = try await weatherService.fetchWeather(
                latitude: location.latitude,
                longitude: location.longitude
            )

            let temp = response.current.temperature2M

            temperatureText = "\(temp) °C"
            iconName = getWeatherIcon(from: temp)

        } catch {
            temperatureText = "Unable to load"
            iconName = "exclamationmark.triangle.fill"
        }
    }

    func getWeatherIcon(from temperature: Double) -> String {
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

