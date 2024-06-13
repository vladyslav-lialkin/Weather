//
//  AveragesViewModel.swift
//  Weather
//
//  Created by Влад Лялькін on 13.06.2024.
//

import Foundation

class AveragesViewModel: ObservableObject {
    
    @Published var maxMinusAvgC = String()
    @Published var maxMinusAvgCDescription = String()
    @Published var todayMaxTempC = String()
    @Published var averageTempC = String()
        
    init(viewModel: WeatherViewModel) {
        if let weather = viewModel.weather {
            let daylyForecast = weather.forecast.forecastday
            let todayForecast = daylyForecast[0].day
            
            let maxMinusAvgC = Int(todayForecast.maxtemp_c - todayForecast.avgtemp_c)
            self.maxMinusAvgC = "\(maxMinusAvgC >= 0 ? "+\(maxMinusAvgC)" : "\(maxMinusAvgC)")°"
            
            maxMinusAvgCDescription = (maxMinusAvgC > 0 ? "above" : "from") + " average daily high"
            
            todayMaxTempC = "H:\(Int(todayForecast.maxtemp_c))°"
            averageTempC = "H:\(Int(todayForecast.avgtemp_c))°"
        }
    }
}
