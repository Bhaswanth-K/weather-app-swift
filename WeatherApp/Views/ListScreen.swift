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

        VStack {

            List(filteredLocations) { location in

                NavigationLink {

                    DetailScreen(location: location)

                } label: {

                    HStack {

                        Text(location.name)

                        Spacer()

                        if let weather =
                            viewModel.weather(for: location.name) {

                            HStack(spacing: 6) {

                                Image(
                                    systemName:
                                    weather.iconName ?? "questionmark"
                                )

                                Text(
                                    "\(Int(weather.temperature))°C"
                                )

                            }

                        }

                    }

                }
                .contextMenu {

                    // Delete saved weather
                    Button(role: .destructive) {

                        viewModel.deleteWeather(
                            city: location.name,
                            context: context
                        )

                    } label: {

                        Label(
                            "Clear Saved Data",
                            systemImage: "trash"
                        )

                    }


                    // Delete location
                    Button(role: .destructive) {

                        viewModel.deleteLocation(
                            city: location.name
                        )

                    } label: {

                        Label(
                            "Remove Location",
                            systemImage: "minus.circle"
                        )

                    }

                }

            }

            // Bottom buttons
            VStack(spacing: 10) {

                Button("Clear All Saved Data") {

                    viewModel.clearAllWeather(
                        context: context
                    )

                }
                .foregroundColor(.red)


                Button("Clear All Locations") {

                    viewModel.clearAllLocations()

                }
                .foregroundColor(.red)

            }
            .padding()

        }

        .navigationTitle("Locations")

        .searchable(
            text: $searchText,
            placement:
                .navigationBarDrawer(displayMode: .always)
        )

        .onAppear {

            viewModel.fetchWeather(context: context)

        }

        .navigationBarItems(
            trailing:
                NavigationLink(
                    destination: SearchLocationView()
                ) {

                    Image(systemName: "plus")

                }
        )

    }

}
