//
//  Current.swift
//  Weather
//
//  Created by Влад Лялькін on 06.06.2024.
//

import Foundation

struct Current: Codable {
    var temp_c: Double = 0.0
    var is_day: Int = 0
    var condition: Condition = Condition(text: "", code: 0)
    var wind_kph: Double = 0.0
    var wind_degree: Double = 0.0
    var wind_dir: String = ""
    var feelslike_c: Double = 0.0
    var gust_kph: Double = 0.0
    var uv: Double = 0.0
}