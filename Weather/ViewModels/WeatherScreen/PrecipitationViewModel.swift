//
//  PrecipitationViewModel.swift
//  Weather
//
//  Created by Влад Лялькін on 11.06.2024.
//

import Foundation

class PrecipitationViewModel: ObservableObject {
    
    @Published var precipMm = String()
    @Published var precipMmDescription = String()
    
    init(viewModel: WeatherViewModel) {
        if let weather = viewModel.weather {
            let precip_mm = weather.current.precip_mm
            precipMm = "\(Int(precip_mm)) mm"

            precipMmDescription = {
                switch precip_mm {
                case ...0.0:
                    return "No precipitation."
                case 0.1...2.5:
                    return "Light rain or drizzle."
                case 2.6...7.6:
                    return "Moderate rain."
                case 7.7...50:
                    return "Heavy rain."
                case 51... :
                    return "Very heavy rain or downpour."
                default:
                    return "Very heavy rain or downpour."
                }
            }()
        }
    }
}
