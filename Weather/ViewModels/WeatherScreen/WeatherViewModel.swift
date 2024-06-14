//
//  MainViewModel.swift
//  Weather
//
//  Created by Влад Лялькін on 28.04.2024.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    
    @Published var cityName = String()
    @Published var isNight = false
    @Published var loading = true
    
    var weather: Weather?
    
    init() {
        Task {
            try await fetchWeather()
        }
    }
    
    func fetchWeather() async throws {
        guard let url = URL(string: "http://api.weatherapi.com/v1/forecast.json?key=fb01ec552bea4466a51174512241406&q=London&days=10&aqi=no&alerts=no") else {
            throw HttpError.badURL
        }
        
        weather = try await HttpClient.shared.fetch(url: url)
        
        DispatchQueue.main.async { [self] in
            if let weather {
                dump(weather)
                
                cityName = weather.location.name
                
                isNight = weather.current.is_day == 0 ? true : false
                loading = false
            }
        }
    }
}
