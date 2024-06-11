//
//  VisibilityViewModel.swift
//  Weather
//
//  Created by Влад Лялькін on 11.06.2024.
//

import Foundation

class VisibilityViewModel: ObservableObject {
    
    @Published var visibilityKm = String()
    @Published var visibilityKmDescription = String()
    
    init(viewModel: WeatherViewModel) {
        if let weather = viewModel.weather {
            let vis_km = weather.current.vis_km
            visibilityKm = "\(Int(vis_km)) km"

            visibilityKmDescription = {
                switch vis_km {
                case ...0:
                    return "No visibility - Stay indoors."
                case 1...2:
                    return "Very Poor - Extreme caution, travel only if essential."
                case 3...4:
                    return "Poor - Objects difficult to see."
                case 5...6:
                    return "Fair - Most objects discernible."
                case 7...8:
                    return "Moderate - Objects clearer."
                case 9...10:
                    return "Good - Most objects clearly visible."
                case 11...:
                    return "Very Good - Objects easily seen at a distance."
                default:
                    return "Very Good - Objects easily seen at a distance."
                }
            }()
        }
    }
}
