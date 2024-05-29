//
//  WeatherView.swift
//  Weather
//
//  Created by Влад Лялькін on 26.04.2024.
//

import SwiftUI

struct WeatherView: View {
    
    @EnvironmentObject private var weatherVM: WeatherViewModel
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                WeatherSummaryView()
                
                if !weatherVM.loading {
                    HourlyForecastView()
                    
                    DailyForecastView()
                    
                    MapForecastView()
                    
                    HStack {
                        UVForecastView()
                        UVForecastView()
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .modifier(ScrollContentBackgroundHiddenModifier())
        }
        .background(BackgroundView(isNight: $weatherVM.isNight))
    }
}

#Preview {
    WeatherView()
        .environmentObject(WeatherViewModel())
}
