//
//  SunTrackerViewModel.swift
//  Weather
//
//  Created by Влад Лялькін on 10.06.2024.
//

import Foundation

class SunTrackerViewModel: ObservableObject {
    
    @Published var astro = Astro()

    var currentSunCycle: (time: String, isSunrise: Bool) {
        isSunRisingOrSetting()
    }
    
    var daySunCycle: (rise: String, set: String) {
        astro.convertTo24HourFormat(astro: .sun)
    }
    
    init(viewModel: WeatherViewModel) {
        if let weather = viewModel.weather {
            astro = weather.forecast.forecastday[0].astro
        }
    }
    
    func isSunRisingOrSetting() -> (time: String, isSunrise: Bool) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:MM"
        let currentTime = dateFormatter.string(from: Date())
        let (sunriseTime, sunsetTime) = astro.convertTo24HourFormat(astro: .sun)
        
        if currentTime > sunriseTime && currentTime <= sunsetTime {
            return (sunsetTime, false) // false means sunset
        } else {
            return (sunriseTime, true) // true means sunrise
        }
    }

    func getNextSunCycle() -> String {
        let nextSunCycle = currentSunCycle.isSunrise ? "Sunset: \(daySunCycle.set)" : "Sunrise: \(daySunCycle.rise)"
        
        return nextSunCycle
    }
}
