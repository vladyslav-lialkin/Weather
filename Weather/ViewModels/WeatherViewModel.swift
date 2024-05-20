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
    
    @Published var backgroundColor = Color(red: 135/255, green: 206/255, blue: 235/255)
    @Published var currentTemp = "--"
    @Published var conditionText = ""
    @Published var cityName = ""
    @Published var loading = true
    
    init() {
        Task {
            try await fetchWeather()
        }
    }
    
    func fetchWeather() async throws {
        guard let url = URL(string: "http://api.weatherapi.com/v1/forecast.json?key=47228454f16f4ff393d181335242604&q=Ukraine,Zdolbuniv&days=10&aqi=no&alerts=no") else {
            throw HttpError.badURL
        }
        
        let weather: Weather = try await HttpClient.shared.fetch(url: url)
        
        DispatchQueue.main.async { [self] in
            dump(weather)
            cityName = weather.location.name
            results = weather.forecast.forecastday
            currentTemp = " \(Int(results[0].day.avgtemp_c))°"
            backgroundColor = getBackgroundColor(code: results[0].day.condition.code)
            conditionText = results[0].day.condition.text
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH"
            let hourNow = dateFormatter.string(from: Date())
            
            hourlyForecast = results[0].hour.filter { hour in
                return hour.getShortTime() >= hourNow
            }
            
            hourlyForecast += results[0].hour.filter { hour in
                return hour.getShortTime() <= hourNow
            }
        }
    }
    
    func getWeatherEmoji(code: Int) -> String {
        var weatherEmoji = "☀️"
        switch code {
        case 1000:
            weatherEmoji = "☀️"
            break
        case 1003:
            weatherEmoji = "🌥️"
            break
        case 1273, 1276, 1279, 1282:
            weatherEmoji = "⛈️"
            break
        case 1087:
            weatherEmoji = "🌩️"
            break
        case 1147, 1135, 1030, 1009, 1006:
            weatherEmoji = "☁️"
            break
        case 1264, 1261, 1258, 1252, 1249, 1201, 1198, 1195, 1192, 1189, 1186, 1183, 1180, 1171, 1168, 1153, 1150, 1072, 1063:
            weatherEmoji = "🌧️"
            break
        case 1255, 1246, 1243, 1240, 1237, 1225, 1222, 1219, 1216, 1213, 1210, 1207, 1204, 1117, 1114, 1069, 1066:
            weatherEmoji = "🌨️"
            break
        default:
            weatherEmoji = "☀️"
            break
        }
        return weatherEmoji
    }
    
    func getBackgroundColor(code: Int) -> Color {
        let blueSky = Color(red: 135/255, green: 206/255, blue: 235/255)
        let greySky = Color(red: 47/255, green: 79/255, blue: 79/255)
        
        var backgroundColor = greySky
        
        switch code {
        case 1000, 1003:
            backgroundColor = blueSky
        default:
            break
        }
        return backgroundColor
    }
}
