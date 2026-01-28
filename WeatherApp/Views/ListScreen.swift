//
//  ListScreen.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import SwiftUI
import CoreData

struct ListScreen: View {

    @State private var searchText = ""

    @Environment(\.managedObjectContext) private var context
    @StateObject private var viewModel = ListViewModel()

    var filteredLocations: [Location] {
        if searchText.isEmpty {
            return locations
        } else {
            return locations.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }

    var body: some View {
        List(filteredLocations) { location in
            NavigationLink {
                DetailScreen(location: location)
            } label: {
                HStack {
                    Text(location.name)

                    Spacer()

                    if let weather = viewModel.weather(for: location.name) {
                        HStack(spacing: 6) {
                            Image(systemName: weather.iconName ?? "questionmark")
                            Text("\(Int(weather.temperature))°C")
                        }
                    }
                }
            }
        }
        .navigationTitle("Locations")
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always)
        )
        .onAppear {
            viewModel.fetchWeather(context: context)
        }
    }
}
