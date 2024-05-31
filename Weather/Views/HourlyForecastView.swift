//
//  HourlyForecastView.swift
//  Weather
//
//  Created by Влад Лялькін on 10.05.2024.
//

import SwiftUI

struct HourlyForecastView: View {
    
    @EnvironmentObject private var weatherVM: WeatherViewModel
    
    var body: some View {
        CustomView(height: 150) {
            VStack {
                Divider()
                    .background(.white)
                    .opacity(0.3)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(weatherVM.hourlyForecast) { forecast in
                            VStack {
                                Text(forecast.getShortTime())
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                
                                let weatherSF = forecast.condition.getWeatherSF(isDay: forecast.is_day)
                                Image(systemName: weatherSF)
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 22,
                                           height: weatherSF == "cloud.fill" ? 17 : 22,
                                           alignment: .center)
                                    .padding(.vertical, 10)
                                
                                Text(" \(Int(forecast.temp_c))˚")
                                    .font(.title3)
                            }
                            .padding(.trailing, forecast.id == weatherVM.hourlyForecast.last?.id ? 0 : 15)
                        }
                    }
                }
                .foregroundStyle(.white)
            }
        } header: {
            Label("HOURLY FORECAST", systemImage: "clock")
        }
    }
}

#Preview {
    HourlyForecastView()
        .environmentObject(WeatherViewModel())
}
