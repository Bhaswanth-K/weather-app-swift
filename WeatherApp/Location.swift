//
//  Location.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let weather: Weather
    let temperature: Temperature
}
