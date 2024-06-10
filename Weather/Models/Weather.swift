//
//  Weather.swift
//  Weather
//
//  Created by Влад Лялькін on 28.04.2024.
//

import Foundation

struct Weather: Codable {
    var location: Location
    var current: Current
    var forecast: Forecast
}
