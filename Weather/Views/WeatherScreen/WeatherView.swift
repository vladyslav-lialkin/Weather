//
//  WeatherView.swift
//  Weather
//
//  Created by Влад Лялькін on 26.04.2024.
//

import SwiftUI

struct WeatherView: View {
    
    @EnvironmentObject private var viewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                WeatherSummaryView(viewModel)
                
                if !viewModel.loading {
                    HourlyForecastView(viewModel)
                    
                    DailyForecastView(viewModel)
                    
                    MapForecastView()
                    
                    HStack {
                        UVIndexView(viewModel)
                        SunTrackerView(viewModel)
                    }
                    
                    WindView(viewModel)
                    
                    HStack {
                        FeelsLikeView(viewModel)
                        FeelsLikeView(viewModel)
                    }
                    
                    DailyForecastView(viewModel)
                    DailyForecastView(viewModel)
                    DailyForecastView(viewModel)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .modifier(ScrollContentBackgroundHiddenModifier())
        }
        .background(BackgroundView(isNight: $viewModel.isNight))
    }
}

#Preview {
    WeatherView()
        .environmentObject(WeatherViewModel())
}