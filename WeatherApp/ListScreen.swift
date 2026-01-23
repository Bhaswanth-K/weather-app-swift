//
//  ListScreen.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import SwiftUI

struct ListScreen: View {

    var body: some View {
        List(locations) { location in
            NavigationLink {
                DetailScreen(location: location)
            } label: {
                HStack {
                    Text(location.name)

                    Spacer()

                    Image(systemName: location.weather.icon)
                        .foregroundColor(.yellow)
                }
            }
        }
        .navigationTitle("Locations")
    }
}
