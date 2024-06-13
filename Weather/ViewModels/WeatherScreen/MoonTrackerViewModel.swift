//
//  MoonTrackerViewModel.swift
//  Weather
//
//  Created by Влад Лялькін on 12.06.2024.
//

import Foundation

class MoonTrackerViewModel: ObservableObject {
    
    @Published var astro = Astro()

    var currentMoonCycle: (time: String, isSunrise: Bool) {
        isMoonRisingOrSetting()
    }
    
    var dayMoonCycle: (rise: String, set: String) {
        astro.convertTo24HourFormat(astro: .moon)
    }
    
    var moonPhase: String {
        astro.moon_phase.uppercased()
    }
    
    var illumination: String {
        "\(astro.moon_illumination)%"
    }
    
    init(viewModel: WeatherViewModel) {
        if let weather = viewModel.weather {
            astro = weather.forecast.forecastday[0].astro
        }
    }
    
    func isMoonRisingOrSetting() -> (time: String, isSunrise: Bool) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:MM"
        let currentTime = dateFormatter.string(from: Date())
        let (moonRiseTime, moonSetTime) = astro.convertTo24HourFormat(astro: .moon)
        
        if currentTime > moonRiseTime && currentTime <= moonSetTime {
            return (moonSetTime, false) // false means moonSet
        } else {
            return (moonRiseTime, true) // true means moonRise
        }
    }
    
    func getCurrentMoonCycle() -> (string: String, number: String) {
        let currentMoonCycle = currentMoonCycle.isSunrise ? ("Current Moonrise", dayMoonCycle.rise) : ("Current Moonset", dayMoonCycle.set)
        
        return currentMoonCycle
    }

    func getNextMoonCycle() -> (string: String, number: String) {
        let nextMoonCycle = currentMoonCycle.isSunrise ? ("Next Moonset", dayMoonCycle.set) : ("Next Moonrise", dayMoonCycle.rise)
        
        return nextMoonCycle
    }
}
