//
//  DailyForecastView.swift
//  Weather
//
//  Created by Влад Лялькін on 14.05.2024.
//

import SwiftUI

struct DailyForecastView: View {
    
    @EnvironmentObject private var weatherVM: WeatherViewModel
    
    var body: some View {
        CustomView(height: 500) {
            VStack(alignment: .leading) {
                ForEach(weatherVM.results) { forecast in
                    Divider()
                        .background(.white)
                        .opacity(0.3)
                    
                    HStack() {
                        Text("\(forecast.getShortDate())")
                            .font(.title3)
                            .fontWeight(.medium)
                            .frame(width: 70, alignment: .leading)

                        Text("\(weatherVM.getWeatherEmoji(code: forecast.day.condition.code))")
                            .font(.title)
                            .frame(width: 30, height: 30, alignment: .leading)
                        
                        Spacer()
                        
                        Text("\(Int(forecast.day.mintemp_c))˚")
                            .font(.title3)
                            .frame(width: 40, alignment: .trailing)
                        
                        let startRange = (forecast.day.mintemp_c/60.0)/2
                        let endRange = (forecast.day.maxtemp_c/60.0)*2
                        ProgressView(value: forecast.day.avgtemp_c/30.0)
                            .frame(width: 100, height: 5, alignment: .trailing)
                            .progressViewStyle(CustomProgressViewStyle(
                                range: (startRange)...(endRange > 1.0 ? 1.0 : endRange),
                                isShowProgressPoint: forecast.id == weatherVM.results.first?.id ? true : false)
                            )
                        
                        Text("\(Int(forecast.day.maxtemp_c))˚")
                            .font(.title3)
                            .frame(width: 40, alignment: .trailing)
                    }
                    .padding(.vertical, 0.1)
                }
            }
            .foregroundStyle(.white)
        } header: {
            Label("10-DAY FORECAST", systemImage: "calendar")
        }
    }
}

#Preview {
    DailyForecastView()
        .environmentObject(WeatherViewModel())
}