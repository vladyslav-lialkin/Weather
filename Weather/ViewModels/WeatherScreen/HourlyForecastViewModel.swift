//
//  HourlyForecastViewModel.swift
//  Weather
//
//  Created by Влад Лялькін on 09.06.2024.
//

import Foundation

class HourlyForecastViewModel: ObservableObject {
    
    @Published var hourlyForecast = [Hour]()
    
    init(viewModel: WeatherViewModel) {
        if let weather = viewModel.weather {
            let daylyForecast = weather.forecast.forecastday
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH"
            let hourNow = dateFormatter.string(from: Date())
            
            hourlyForecast = daylyForecast[0].hour.filter { hour in
                return hour.getShortTime() >= hourNow
            }
            
            hourlyForecast += daylyForecast[1].hour.filter { hour in
                return hour.getShortTime() <= hourNow
            }
        }
    }
    
    func getWeatherSF(_ forecast: Hour) -> String {
        forecast.condition.getWeatherSF(isDay: forecast.is_day)
    }
    
    func getHeightForWetherSF(_ forecast: Hour) -> Double {
        getWeatherSF(forecast) == "cloud.fill" ? 17 : 22
    }
    
    func getTempC(_ forecast: Hour) -> String {
        " \(Int(forecast.temp_c))˚"
    }
    
    func getPaddingValue(_ forecast: Hour) -> Double {
        forecast.id == hourlyForecast[9].id ? 0 : 15
    }
}
