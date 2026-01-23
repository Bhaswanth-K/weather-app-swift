//
//  DetailScreen.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import SwiftUI

struct DetailScreen: View {

    let location: Location

    var body: some View {
        VStack(spacing: 20) {

            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            Image(systemName: location.weather.icon)
                .resizable()
                .frame(width: 120, height: 120)
                .foregroundColor(.yellow)

            Text(location.temperature.temperatureText)
                .font(.title2)

            Text("""
A warm breeze drifted through the streets as the afternoon sun hovered behind a veil of scattered clouds. In the north, the air felt dry and dusty, while the southern coast carried the familiar scent of moisture from the sea.
""")
            .foregroundColor(.gray)
            .padding()
        }
        .navigationTitle("Details")
    }
}
