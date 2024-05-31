//
//  ForecastDay.swift
//  Weather
//
//  Created by Влад Лялькін on 31.05.2024.
//

import Foundation

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
