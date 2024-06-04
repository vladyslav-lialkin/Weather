//
//  MainViewModel.swift
//  Weather
//
//  Created by Влад Лялькін on 28.04.2024.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    
    @Published var results = [ForecastDay]()
    @Published var hourlyForecast = [Hour]()
    
    @Published var isNight = false
    @Published var cityName = ""
    @Published var currentTemp = "--"
    @Published var conditionText = ""
    @Published var highAndLowTemp = ""
    @Published var loading = true
    
    init() {
        Task {
            try await fetchWeather()
        }
    }
    
    func fetchWeather() async throws {
//        guard let url = URL(string: "http://api.weatherapi.com/v1/forecast.json?key=47228454f16f4ff393d181335242604&q=Los Angeles&days=10&aqi=no&alerts=no") else {
//            throw HttpError.badURL
//        }
        guard let url = URL(string: "http://api.weatherapi.com/v1/forecast.json?key=47228454f16f4ff393d181335242604&q=Ukraine,Zdolbuniv&days=10&aqi=no&alerts=no") else {
            throw HttpError.badURL
        }
        
        let weather: Weather = try await HttpClient.shared.fetch(url: url)
        
        DispatchQueue.main.async { [self] in
            dump(weather)
            cityName = weather.location.name
            results = weather.forecast.forecastday
            currentTemp = " \(Int(results[0].day.avgtemp_c))°"
            conditionText = results[0].day.condition.text
            highAndLowTemp = "H:\(Int(results[0].day.maxtemp_c))° L:\(Int(results[0].day.mintemp_c))°"
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH"
//            dateFormatter.timeZone = TimeZone(identifier: "America/Los_Angeles")
            let hourNow = dateFormatter.string(from: Date())
            
            hourlyForecast = results[0].hour.filter { hour in
                return hour.getShortTime() >= hourNow
            }
            
            hourlyForecast += results[1].hour.filter { hour in
                return hour.getShortTime() <= hourNow
            }
            
            isNight = hourlyForecast.first?.is_day == 0 ? true : false
            loading = false
        }
    }
}
