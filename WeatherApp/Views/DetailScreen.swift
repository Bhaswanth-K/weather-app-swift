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

    var body: some View {
        VStack(spacing: 20) {

            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            Image(systemName: viewModel.iconName)
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)

            Text(viewModel.temperatureText)
                .font(.title)
        }
        .task {
            await viewModel.fetchWeather(
                latitude: location.latitude,
                longitude: location.longitude
            )
        }
    }
}

