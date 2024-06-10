//
//  UVIndexViewModel.swift
//  Weather
//
//  Created by Влад Лялькін on 10.06.2024.
//

import Foundation

class UVIndexViewModel: ObservableObject {
    
    @Published var currentForecast = Current()
    @Published var uv = String()
    @Published var shortDescripiton = String()
    @Published var longDescripiton = String()
    
    init(viewModel: WeatherViewModel) {
        if let weather = viewModel.weather {
            currentForecast = weather.current

            uv = "\(Int(currentForecast.uv))"
            
            (shortDescripiton, longDescripiton) = {
                switch currentForecast.uv {
                case 0...2:
                    return ("Low", "Minimal risk. No protection needed.")
                case 3...5:
                    return ("Moderate", "Moderate risk. Use sunscreen.")
                case 6...7:
                    return ("High", "High risk. Protect skin and eyes.")
                case 8...10:
                    return ("Very high", "Very high risk. Avoid sun exposure.")
                case 11...:
                    return ("Extreme", "Extreme risk. Stay in shade.")
                default:
                    return ("", "")
                }
            }()
        }
    }

    func getProgressValue() -> Double {
        let value = (currentForecast.uv)/11
        let adjustedValue = value <= 0.02 ? 0.02 : (value == 1.0 ? 0.98 : value)
        
        return adjustedValue
    }
}
