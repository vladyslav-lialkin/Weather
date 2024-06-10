//
//  WeatherSummaryViewModel.swift
//  Weather
//
//  Created by Влад Лялькін on 09.06.2024.
//

import Foundation

class WeatherSummaryViewModel: ObservableObject {
    
    @Published var cityName = ""
    @Published var currentTemp = "--"
    @Published var conditionText = ""
    @Published var highAndLowTemp = ""
    
    var currentTempAndConditionText: String {
        return "\(currentTemp) | \(conditionText)"
    }
    
    init(viewModel: WeatherViewModel) {
        if let weather = viewModel.weather {
            let daylyForecast = weather.forecast.forecastday
            
            cityName = weather.location.name
            currentTemp = " \(Int(weather.current.temp_c))°"
            conditionText = weather.current.condition.text
            highAndLowTemp = "H:\(Int(daylyForecast[0].day.maxtemp_c))° L:\(Int(daylyForecast[0].day.mintemp_c))°"
        }
    }
    
    func getOpacityValue(_ height: Double,_ threshold: Double,_ startFading: Double) -> Double {
        height <= threshold ? (height - startFading) / 30.0 : 1.0
    }
}
