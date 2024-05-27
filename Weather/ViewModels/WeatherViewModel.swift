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
//        guard let url = URL(string: "http://api.weatherapi.com/v1/forecast.json?key=47228454f16f4ff393d181335242604&q=LosAngeles&days=10&aqi=no&alerts=no") else {
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
        }
    }
    
    func getWeatherSF(code: Int, isDay: Int?) -> String {
        if let isDay, isDay == 0 {
            switch code {
            case 1000:
                return "moon.stars.fill"
            default:
                return "cloud.moon.fill"
            }
        }
        
        var weatherSF = "sun.max.fill"
        switch code {
        case 1000:
            weatherSF = "sun.max.fill"
            break
        case 1003:
            weatherSF = "cloud.sun.fill"
            break
        case 1273, 1276, 1279, 1282:
            weatherSF = "cloud.bolt.rain.fill"
            break
        case 1087:
            weatherSF = "cloud.bolt.fill"
            break
        case 1147, 1135, 1030, 1009, 1006:
            weatherSF = "cloud.fill"
            break
        case 1264, 1261, 1258, 1252, 1249, 1201, 1198, 1195, 1192, 1189, 1186, 1183, 1180, 1171, 1168, 1153, 1150, 1072, 1063:
            weatherSF = "cloud.drizzle.fill"
            break
        case 1255, 1246, 1243, 1240, 1237, 1225, 1222, 1219, 1216, 1213, 1210, 1207, 1204, 1117, 1114, 1069, 1066:
            weatherSF = "cloud.snow.fill"
            break
        default:
            weatherSF = "sun.max.fill"
            break
        }
        return weatherSF
    }
}
