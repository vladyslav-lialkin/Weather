//
//  Weather.swift
//  Weather
//
//  Created by Влад Лялькін on 28.04.2024.
//

import Foundation

struct Weather: Codable {
    var location: Location
    var forecast: Forecast
}

struct Location: Codable {
    var name: String
}

struct Forecast: Codable {
    var forecastday: [ForecastDay]
}

struct ForecastDay: Codable, Identifiable {
    var id: Int { date_epoch }
    var date_epoch: Int
    var day: Day
    var hour: [Hour]
    
    func getShortDate() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(date_epoch))
        let calendar = Calendar.current
        
        if calendar.isDateInToday(date) {
            return "Today"
        } else {
            return date.formatted(Date.FormatStyle().weekday(.abbreviated))
        }
    }
}

struct Day: Codable {
    var maxtemp_c: Double
    var mintemp_c: Double
    var avgtemp_c: Double
    var condition: Condition
}

struct Condition: Codable {
    var text: String
    var code: Int
}

struct Hour: Codable, Identifiable {
    var id: Int { time_epoch }
    var time_epoch: Int
    var time: String
    var temp_c: Double
    var is_day: Int
    var condition: Condition
    var uv: Double
    
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
    
    func getUVSubtitle() -> (String, String) {
        switch uv {
        case 0...2:
            return ("Low", "Minimal risk. No protection needed.")
        case 3...5:
            return ("Moderate", "Moderate risk. Use sunscreen.")
        case 6...7:
            return ("High", "High risk. Protect skin and eyes.")
        case 8...10:
            return ("Very high", "Very high risk. Avoid sun exposure.")
        case 11...:
            return ("Extreme", "Extreme risk. Stay in shade.")
        default:
            return ("", "")
        }
    }
}
