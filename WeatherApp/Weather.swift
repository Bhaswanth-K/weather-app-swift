//
//  Weather.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

enum Weather {
    case sunny
    case cloudy
    case rainy
    case snowy

    var icon: String {
        switch self {
        case .sunny:
            return "sun.max.fill"
        case .cloudy:
            return "cloud.fill"
        case .rainy:
            return "cloud.rain.fill"
        case .snowy:
            return "snowflake"
        }
    }
}


