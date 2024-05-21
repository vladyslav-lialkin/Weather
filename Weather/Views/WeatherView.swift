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
                
                HourlyForecastView()
                
                DailyForecastView()
            }
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
