//
//  Temperature.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import SwiftUI

struct Temperature {
    let min: Int
    let max: Int

    var temperatureText: String {
        "\(min) °C / \(max) °C"
    }
}
