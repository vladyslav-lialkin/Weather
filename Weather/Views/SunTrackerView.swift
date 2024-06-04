//
//  SunTrackerView.swift
//  Weather
//
//  Created by Влад Лялькін on 30.05.2024.
//

import SwiftUI

struct SunTrackerView: View {
    
    @EnvironmentObject private var weatherVM: WeatherViewModel
    
    private var astro: Astro {
        weatherVM.results.first?.astro ?? Astro(sunrise: "", sunset: "")
    }
    
    var sunCycle: (time: String, isSunrise: Bool) {
        astro.isSunRisingOrSetting()
    }
    
    var nextSunCycle: (sunrise: String, sunset: String) {
        astro.convertTo24HourFormat()
    }
    
    
    var body: some View {
        CustomView(height: 170) {
            ZStack(alignment: .leading) {
                WaveView()
                    .padding(.top, 10)
                    .frame(height: 140)
                
                VStack(alignment: .leading) {
                    Text(sunCycle.time)
                        .font(.largeTitle)
                        .padding(.top, 3)
                        .padding(.leading)
                    
                    Spacer()
                    
                    Text(sunCycle.isSunrise ? "Sunset: \(nextSunCycle.sunset)" : "Sunrise: \(nextSunCycle.sunrise)")
                        .font(.system(size: 15))
                        .padding(.leading)
                        .padding(.bottom)
                }
                .foregroundStyle(.white)
            }
        } header: {
            if sunCycle.isSunrise {
                Label("SUNRISE", systemImage: "sunrise.fill")
            } else {
                Label("SUNSET", systemImage: "sunset.fill")
            }
        }
    }
}

#Preview {
    WeatherView()
        .environmentObject(WeatherViewModel())
}
