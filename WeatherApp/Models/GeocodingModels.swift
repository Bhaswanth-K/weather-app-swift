//
//  GeocodingModels.swift
//  WeatherApp
//
//  Created by rentamac on 2/5/26.
//
import Foundation

struct GeocodingResponse: Codable {
    let results: [GeocodingResult]?
}

struct GeocodingResult: Codable {
    let id: Int
    let name: String
    let latitude: Double
    let longitude: Double
}
