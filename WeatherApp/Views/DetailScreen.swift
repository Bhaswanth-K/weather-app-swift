//
//  DetailScreen.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import SwiftUI

struct DetailScreen: View {

    let location: Location
    @StateObject private var viewModel = DetailViewModel()
    
    @Environment(\.managedObjectContext) private var context

    var body: some View {

        ScrollView {

            VStack(spacing: 20) {

                Text(location.name)
                    .font(.largeTitle)
                    .bold()

                Image(systemName: viewModel.iconName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.yellow)

                Text(viewModel.temperatureText)
                    .font(.title)

                Text("from \(viewModel.sourceText)")
                    .padding(6)
                    .background(viewModel.sourceColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                // GRID BOXES
                LazyVGrid(
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ],
                    spacing: 16
                ) {

                    WeatherBoxView(
                        title: "Wind Speed",
                        value: viewModel.windSpeed
                    )

                    WeatherBoxView(
                        title: "Humidity",
                        value: viewModel.humidity
                    )

                    WeatherBoxView(
                        title: "UV Index",
                        value: "0.2"
                    )

                    WeatherBoxView(
                        title: "Rain",
                        value: "6.8"
                    )

                    WeatherBoxView(
                        title: "Sunrise",
                        value: "06:30"
                    )

                    WeatherBoxView(
                        title: "Sunset",
                        value: "18:45"
                    )

                }
                .padding()

            }

        }
        .task {

            await viewModel.fetchWeather(
                latitude: location.latitude,
                longitude: location.longitude,
                cityName: location.name,
                context: context
            )

        }

    }

}

