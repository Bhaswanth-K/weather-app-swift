//
//  Weather.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import SwiftUI

enum Weather {
    case sunny
    case foggy
    case snow
    case rainy
    case windy

    var icon: String {
        switch self {
        case .sunny:
            return "sun.max.fill"
        case .foggy:
            return "cloud.fog.fill"
        case .snow:
            return "snowflake"
        case .rainy:
            return "cloud.rain.fill"
        case .windy:
            return "wind"
        }
    }
}

