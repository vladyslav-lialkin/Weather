//
//  Condition.swift
//  Weather
//
//  Created by Влад Лялькін on 31.05.2024.
//

import Foundation

struct Condition: Codable {
    var text: String
    var code: Int
    
    func getWeatherSF(isDay: Int?) -> String {
        if let isDay, isDay == 0 {
            switch code {
            case 1000:
                return "moon.stars.fill"
            default:
                return "cloud.moon.fill"
            }
        }
        
        var weatherSF = "sun.max.fill"
        switch code {
        case 1000:
            weatherSF = "sun.max.fill"
            break
        case 1003:
            weatherSF = "cloud.sun.fill"
            break
        case 1273, 1276, 1279, 1282:
            weatherSF = "cloud.bolt.rain.fill"
            break
        case 1087:
            weatherSF = "cloud.bolt.fill"
            break
        case 1147, 1135, 1030, 1009, 1006:
            weatherSF = "cloud.fill"
            break
        case 1264, 1261, 1258, 1252, 1249, 1201, 1198, 1195, 1192, 1189, 1186, 1183, 1180, 1171, 1168, 1153, 1150, 1072, 1063:
            weatherSF = "cloud.drizzle.fill"
            break
        case 1255, 1246, 1243, 1240, 1237, 1225, 1222, 1219, 1216, 1213, 1210, 1207, 1204, 1117, 1114, 1069, 1066:
            weatherSF = "cloud.snow.fill"
            break
        default:
            weatherSF = "sun.max.fill"
            break
        }
        return weatherSF
    }
}
