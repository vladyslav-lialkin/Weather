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
            precipMm = "\(Int(precip_mm))"

            precipMmDescription = {
                switch precip_mm {
                case ..<0.0:
                    return "No precipitation."
                case ..<2.5:
                    return "Light rain or drizzle."
                case ..<7.6:
                    return "Moderate rain."
                case ..<50:
                    return "Heavy rain."
                case ..<50:
                    return "Very heavy rain or downpour."
                default:
                    return "Very heavy rain or downpour."
                }
            }()
        }
    }
}
