//
//  PressureViewModel.swift
//  Weather
//
//  Created by Влад Лялькін on 13.06.2024.
//

import Foundation

class PressureViewModel: ObservableObject {
    
    @Published var pressure = String()
    @Published var degreePosition = Double()

        
    init(viewModel: WeatherViewModel) {
        if let weather = viewModel.weather {
            let pressure_mb = weather.current.pressure_mb
            
            pressure = "\(Int(pressure_mb))"
            
            degreePosition = 250 / (90 / (pressure_mb - 970))
            degreePosition = degreePosition < 0.0 ? 0 : (degreePosition > 250.0 ? 250.0 : degreePosition)
        }
    }
}
