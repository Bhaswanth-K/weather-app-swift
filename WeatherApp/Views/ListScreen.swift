//
//  ListScreen.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import SwiftUI

struct ListScreen: View {

    @State private var searchText = ""

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
                Text(location.name)
            }
        }
        .navigationTitle("Locations")
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always)
        )
    }
}
