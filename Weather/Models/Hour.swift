//
//  Hour.swift
//  Weather
//
//  Created by Влад Лялькін on 31.05.2024.
//

import Foundation

struct Hour: Codable, Identifiable {
    var id: Int { time_epoch }
    var time_epoch: Int
    var time: String
    var temp_c: Double
    var is_day: Int
    var condition: Condition
    
    func getShortTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        if let date = dateFormatter.date(from: time) {
            let calendar = Calendar.current
            let currentHour = calendar.component(.hour, from: Date())
            let hourFromJSON = calendar.component(.hour, from: date)
            
            if currentHour == hourFromJSON {
                return "Now"
            } else {
                dateFormatter.dateFormat = "HH"
                return dateFormatter.string(from: date)
            }
        } else {
            return ""
        }
    }
}
