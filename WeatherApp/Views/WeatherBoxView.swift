//
//  WeatherBoxView.swift
//  WeatherApp
//
//  Created by rentamac on 2/5/26.
//

import SwiftUI

struct WeatherBoxView: View {

    var title: String
    var value: String

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            Text(title)
                .font(.caption)
                .foregroundColor(.gray)

            Text(value)
                .font(.title2)
                .fontWeight(.bold)

        }
        .frame(maxWidth: .infinity, minHeight: 80)
        .padding()
        .background(Color.green.opacity(0.2))
        .cornerRadius(12)

    }

}
