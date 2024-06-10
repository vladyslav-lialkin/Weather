//
//  MainViewModel.swift
//  Weather
//
//  Created by Влад Лялькін on 28.04.2024.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    
    @Published var weather: Weather?
    
    @Published var isNight = false
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
        
        weather = try await HttpClient.shared.fetch(url: url)
        
        DispatchQueue.main.async { [self] in
            if let weather {
                dump(weather)
                
                isNight = weather.current.is_day == 0 ? true : false
                loading = false
            }
        }
    }
}
