//
//  ContentView.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {

                Image(systemName: "umbrella.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)

                Text("Breeze")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Weather App")
                    .foregroundColor(.gray)

                NavigationLink {
                    ListScreen()
                } label: {
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }
            }
        }
    }
}
