//
//  WeatherApp.swift
//  Weather
//
//  Created by Влад Лялькін on 26.04.2024.
//

import SwiftUI

@main
struct WeatherApp: App {
    @StateObject private var weatherVM = WeatherViewModel()
    
    var body: some Scene {
        WindowGroup {
            WeatherView()
                .environmentObject(weatherVM)
                .preferredColorScheme(.light)
        }
    }
}
