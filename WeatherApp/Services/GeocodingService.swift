//
//  GeocodingService.swift
//  WeatherApp
//
//  Created by rentamac on 2/5/26.
//

import Foundation

struct GeocodingService {

    func searchLocations(name: String) async -> [GeocodingResult] {
        guard let url = URL(
            string: "https://geocoding-api.open-meteo.com/v1/search?name=\(name)&count=5"
        ) else { return [] }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(GeocodingResponse.self, from: data)
            return response.results ?? []
        } catch {
            print("Geocoding error:", error)
            return []
        }
    }
}
