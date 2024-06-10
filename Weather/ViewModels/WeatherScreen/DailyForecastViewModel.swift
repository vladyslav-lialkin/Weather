//
//  DailyForecastViewModel.swift
//  Weather
//
//  Created by Влад Лялькін on 09.06.2024.
//

import Foundation

class DailyForecastViewModel: ObservableObject {
    
    @Published var daylyForecast = [ForecastDay]()
    
    lazy var firstHourForecast: Hour? = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        let hourNow = dateFormatter.string(from: Date())
        
        return daylyForecast[0].hour.first { hour in
            hour.getShortTime() >= hourNow
        }
    }()
    
    init(viewModel: WeatherViewModel) {
        if let weather = viewModel.weather {
            daylyForecast = weather.forecast.forecastday      
        }
    }
    
    func getWeatherSF(_ forecast: ForecastDay) -> String {
        guard let firstHourForecast else { return "" }
        let dayID = daylyForecast[0].id
        let weatherSF = forecast.day.condition.getWeatherSF(isDay: dayID == forecast.id ? firstHourForecast.is_day : nil)
        
        return weatherSF
    }
    
    func getMinTempC(_ forecast: ForecastDay) -> String {
        "\(Int(forecast.day.mintemp_c))˚"
    }
    
    func getMaxTempC(_ forecast: ForecastDay) -> String {
        "\(Int(forecast.day.maxtemp_c))˚"
    }
    
    func getProgressValue(_ forecast: ForecastDay) -> Double {
        let value = forecast.day.avgtemp_c/30.0
        let adjustedValue = value <= 0.02 ? 0.02 : (value == 1.0 ? 0.98 : value)
        
        return adjustedValue
    }
    
    func getProgressRange(_ forecast: ForecastDay) -> ClosedRange<Double> {
        let startRange = (forecast.day.mintemp_c/60.0)/2
        let endRange = (forecast.day.maxtemp_c/60.0)*2
        
        return (startRange)...(endRange > 1.0 ? 1.0 : endRange)
    }
    
    func getIsShowProgressPoint(_ forecast: ForecastDay) -> Bool {
        forecast.id == daylyForecast[0].id ? true : false
    }
}
