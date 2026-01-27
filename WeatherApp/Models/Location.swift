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
    let latitude: Double
    let longitude: Double
}
