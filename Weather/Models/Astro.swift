//
//  Astro.swift
//  Weather
//
//  Created by Влад Лялькін on 01.06.2024.
//

import Foundation

enum AstroEnum {
    case sun
    case moon
}

struct Astro: Codable {
    var sunrise: String = ""
    var sunset: String = ""
    var moonrise: String = ""
    var moonset: String = ""
    var moon_phase: String = ""
    var moon_illumination: Int = 0
    
    func convertTo24HourFormat(astro: AstroEnum) -> (rise: String, set: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        if let astroRiseDate = dateFormatter.date(from: astro == .sun ? sunrise : moonrise),
           let astroSetDate = dateFormatter.date(from: astro == .sun ? sunset : moonset) {
            dateFormatter.dateFormat = "HH:mm"
            return (dateFormatter.string(from: astroRiseDate), dateFormatter.string(from: astroSetDate))
        }
        return ("", "")
    }
}
