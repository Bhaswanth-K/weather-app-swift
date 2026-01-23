//
//  LocationData.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import SwiftUI

let locations: [Location] = [
    Location(
        name: "Mumbai",
        weather: .sunny,
        temperature: Temperature(min: 22, max: 32)
    ),
    Location(
        name: "New Delhi",
        weather: .foggy,
        temperature: Temperature(min: 11, max: 24)
    ),
    Location(
        name: "Chennai",
        weather: .sunny,
        temperature: Temperature(min: 24, max: 36)
    ),
    Location(
        name: "Pune",
        weather: .sunny,
        temperature: Temperature(min: 22, max: 32)
    ),
    Location(
        name: "Bengaluru",
        weather: .rainy,
        temperature: Temperature(min: 24, max: 30)
    ),
    Location(
        name: "Gurgaon",
        weather: .foggy,
        temperature: Temperature(min: 11, max: 23)
    ),
    Location(
        name: "Noida",
        weather: .snow,
        temperature: Temperature(min: 9, max: 22)
    ),
    Location(
        name: "Hyderabad",
        weather: .windy,
        temperature: Temperature(min: 22, max: 32)
    )
]
