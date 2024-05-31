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

                        Image(systemName: forecast.day.condition.getWeatherSF(isDay: weatherVM.results.first?.id == forecast.id ?
                                                                                     weatherVM.hourlyForecast.first?.is_day : nil))
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 22, height: 22, alignment: .center)
                        
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
                                colors: [Color(red: 0.39, green: 0.8, blue: 0.74), Color(red: 0.96, green: 0.8, blue: 0.0)],
                                isShowProgressPoint: forecast.id == weatherVM.results.first?.id ? true : false)
                            )
                        
                        Text("\(Int(forecast.day.maxtemp_c))˚")
                            .font(.title3)
                            .frame(width: 40, alignment: .trailing)
                    }
                    .padding(.vertical, 0.1)
                    .frame(height: 30)
                }
            }
            .foregroundStyle(.white)
            .padding(.horizontal)
        } header: {
            Label("10-DAY FORECAST", systemImage: "calendar")
        }
    }
}

#Preview {
    DailyForecastView()
        .environmentObject(WeatherViewModel())
}
