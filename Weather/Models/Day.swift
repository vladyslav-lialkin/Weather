//
//  Day.swift
//  Weather
//
//  Created by Влад Лялькін on 31.05.2024.
//

import Foundation

struct Day: Codable {
    var maxtemp_c: Double
    var mintemp_c: Double
    var avgtemp_c: Double
    var condition: Condition
}
