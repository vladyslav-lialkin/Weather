//
//  HourlyForecastView.swift
//  Weather
//
//  Created by Влад Лялькін on 10.05.2024.
//

import SwiftUI

struct HourlyForecastView: View {
    
    @ObservedObject var viewModel: HourlyForecastViewModel
    
    var body: some View {
        CustomView(height: 150) {
            VStack {
                Divider()
                    .background(.white)
                    .opacity(0.3)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.hourlyForecast) { forecast in
                            VStack {
                                Text(forecast.getShortTime())
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                
                                Image(systemName: viewModel.getWeatherSF(forecast))
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 22,
                                           height: viewModel.getHeightForWetherSF(forecast),
                                           alignment: .center)
                                    .padding(.vertical, 10)
                                
                                Text(viewModel.getTempC(forecast))
                                    .font(.title3)
                            }
                            .padding(.trailing, viewModel.getPaddingValue(forecast))
                        }
                    }
                }
                .foregroundStyle(.white)
            }
            .padding(.horizontal)
        } header: {
            Label("HOURLY FORECAST", systemImage: "clock")
        }
    }
    
    init(_ viewModel: WeatherViewModel) {
        self.viewModel = HourlyForecastViewModel(viewModel: viewModel)
    }
}

#Preview {
    HourlyForecastView(WeatherViewModel())
}
