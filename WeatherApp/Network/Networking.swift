//
//  Networking.swift
//  WeatherApp
//
//  Created by rentamac on 1/27/26.
//

import Foundation

protocol Networking {
    func request<T: Decodable>(
        endpoint: APIEndpoint,
        responseType: T.Type
    ) async throws -> T
}
