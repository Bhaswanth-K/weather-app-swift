//
//  SearchLocationView.swift
//  WeatherApp
//
//  Created by rentamac on 2/5/26.
//
import SwiftUI

struct SearchLocationView: View {

    @State private var query = ""
    @State private var results: [GeocodingResult] = []
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter city", text: $query)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                Button("Search") {
                    Task { await searchCity() }
                }

                List(results, id: \.id) { loc in
                    Button(loc.name) {
                        addLocation(loc)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Location")
        }
    }

    func searchCity() async {
        results = await GeocodingService().searchLocations(name: query)
    }

    func addLocation(_ loc: GeocodingResult) {
        let newLocation = Location(
            name: loc.name,
            latitude: loc.latitude,
            longitude: loc.longitude
        )
        locations.append(newLocation)
    }
}

