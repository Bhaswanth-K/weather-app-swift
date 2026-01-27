//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by rentamac on 1/27/26.
//

struct WeatherResponse: Codable {
    let current: Current
}

struct Current: Codable {
    let temperature2M: Double

    enum CodingKeys: String, CodingKey {
        case temperature2M = "temperature_2m"
    }
}
