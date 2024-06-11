//
//  FeelsLikeViewModel.swift
//  Weather
//
//  Created by Влад Лялькін on 10.06.2024.
//

import Foundation

class FeelsLikeViewModel: ObservableObject {
    
    @Published var feelsLikeC = String()
    @Published var feelsLikeDescription = String()
        
    init(viewModel: WeatherViewModel) {
        if let weather = viewModel.weather {
            let feelslike_c = weather.current.feelslike_c
            feelsLikeC = "\(Int(feelslike_c))˚"
            
            feelsLikeDescription = {
                switch feelslike_c {
                case ..<0:
                    return "The wind is making it feel colder."
                case 0..<10:
                    return "Humidity is making it feel cooler."
                case 10..<20:
                    return "Dry air is creating an additional chill."
                case 20..<30:
                    return "Humidity is making it feel warmer."
                case 30..<40:
                    return "Calm weather is increasing the feeling of warmth."
                default:
                    return "High humidity is making it feel extremely hot."
                }
            }()
        }
    }
}
