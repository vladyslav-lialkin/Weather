//
//  DailyForecastView.swift
//  Weather
//
//  Created by Влад Лялькін on 14.05.2024.
//

import SwiftUI

struct DailyForecastView: View {
    
    @ObservedObject var viewModel: DailyForecastViewModel
    
    var body: some View {
        CustomView(height: 500) {
            VStack(alignment: .leading) {
                ForEach(viewModel.daylyForecast) { forecast in
                    Divider()
                        .background(.white)
                        .opacity(0.3)
                    
                    HStack() {
                        Text(forecast.getShortDate())
                            .font(.title3)
                            .fontWeight(.medium)
                            .frame(width: 70, alignment: .leading)

                        Image(systemName: viewModel.getWeatherSF(forecast))
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 22, height: 22, alignment: .center)
                        
                        Spacer()
                        
                        Text(viewModel.getMinTempC(forecast))
                            .font(.title3)
                            .frame(width: 40, alignment: .trailing)
                        
                        ProgressView(value: viewModel.getProgressValue(forecast))
                            .frame(width: 100, height: 5, alignment: .trailing)
                            .progressViewStyle(CustomProgressViewStyle(
                                range: viewModel.getProgressRange(forecast),
                                colors: [Color(red: 0.39,
                                               green: 0.8,
                                               blue: 0.74),
                                         Color(red: 0.96,
                                               green: 0.8,
                                               blue: 0.0)],
                                isShowProgressPoint: viewModel.getIsShowProgressPoint(forecast))
                            )
                        
                        Text(viewModel.getMaxTempC(forecast))
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
    
    init(_ viewModel: WeatherViewModel) {
        self.viewModel = DailyForecastViewModel(viewModel: viewModel)
    }
}

#Preview {
    DailyForecastView(WeatherViewModel())
}
