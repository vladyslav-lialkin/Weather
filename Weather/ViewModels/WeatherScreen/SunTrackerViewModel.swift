//
//  SunTrackerViewModel.swift
//  Weather
//
//  Created by Влад Лялькін on 10.06.2024.
//

import Foundation

class SunTrackerViewModel: ObservableObject {
    
    @Published var astro = Astro(sunrise: "", sunset: "")

    var currentSunCycle: (time: String, isSunrise: Bool) {
        astro.isSunRisingOrSetting()
    }
    
    var daySunCycle: (sunrise: String, sunset: String) {
        astro.convertTo24HourFormat()
    }
    
    init(viewModel: WeatherViewModel) {
        if let weather = viewModel.weather {
            astro = weather.forecast.forecastday[0].astro
        }
    }

    func getNextSunCycle() -> String {
        let nextSunCycle = currentSunCycle.isSunrise ? "Sunset: \(daySunCycle.sunset)" : "Sunrise: \(daySunCycle.sunrise)"
        
        return nextSunCycle
    }
}
