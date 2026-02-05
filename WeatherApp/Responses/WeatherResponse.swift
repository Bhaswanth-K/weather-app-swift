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
    let windSpeed: Double
    let relativeHumidity: Double

    enum CodingKeys: String, CodingKey {

        case temperature2M = "temperature_2m"
        case windSpeed = "wind_speed_10m"
        case relativeHumidity = "relative_humidity_2m"

    }

}

