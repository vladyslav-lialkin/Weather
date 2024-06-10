//
//  WindViewModel.swift
//  Weather
//
//  Created by Влад Лялькін on 10.06.2024.
//

import Foundation

class WindViewModel: ObservableObject {
    
    @Published var windMps = String()
    @Published var gustMps = String()
    @Published var windDegree = Double()
    @Published var windDir = String()

    init(viewModel: WeatherViewModel) {
        if let weather = viewModel.weather {
            let current = weather.current
            
            windMps = "\(Int(current.wind_kph * 0.2778))"
            gustMps = "\(Int(current.gust_kph * 0.2778))"
            windDegree = current.wind_degree
            windDir = current.wind_dir
        }
    }
}
