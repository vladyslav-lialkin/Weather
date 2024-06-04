//
//  Astro.swift
//  Weather
//
//  Created by Влад Лялькін on 01.06.2024.
//

import Foundation

struct Astro: Codable {
    var sunrise: String
    var sunset: String
    
    func convertTo24HourFormat() -> (sunrise: String, sunset: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        if let sunriseDate = dateFormatter.date(from: sunrise), let sunsetDate = dateFormatter.date(from: sunset) {
            dateFormatter.dateFormat = "HH:mm"
            return (dateFormatter.string(from: sunriseDate), dateFormatter.string(from: sunsetDate))
        }
        return ("", "")
    }

    func isSunRisingOrSetting() -> (time: String, isSunrise: Bool) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:MM"
        let currentTime = dateFormatter.string(from: Date())
        let (sunriseTime, sunsetTime) = convertTo24HourFormat()
        
        if currentTime > sunriseTime && currentTime <= sunsetTime {
            return (sunsetTime, false) // false means sunset
        } else {
            return (sunriseTime, true) // true means sunrise
        }
    }
}
