//
//  HumidityViewModel.swift
//  Weather
//
//  Created by Влад Лялькін on 11.06.2024.
//

import Foundation

class HumidityViewModel: ObservableObject {
    
    @Published var humidity = String()
    @Published var humidityDescription = String()
    
    init(viewModel: WeatherViewModel) {
        if let weather = viewModel.weather {
            let humidity = weather.current.humidity
            self.humidity = "\(humidity)%"

            humidityDescription = {
                switch humidity {
                case 0...20:
                    return "Very Dry - Skin issues likely."
                case 21...30:
                    return "Low - Still dry, but less extreme."
                case 31...40:
                    return "Moderately Low - Air feels more comfortable."
                case 41...50:
                    return "Ideal - Recommended humidity for comfort."
                case 51...60:
                    return "Moderately High - Slightly humid but still comfy."
                case 61...70:
                    return "High - Air becomes muggy and may feel unpleasant."
                case 71...80:
                    return "Very High - Uncomfortable for those not used to it."
                case 81...90:
                    return "Extremely High - Condensation and breathing problems possible."
                case 91...:
                    return "Maximum - Air feels impenetrable."
                default:
                    return "Maximum - Air feels impenetrable."
                }
            }()
        }
    }
}
