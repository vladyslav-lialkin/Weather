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
                        PrecipitationView(viewModel)
                    }
                    
                    HStack {
                        VisibilityView(viewModel)
                        HumidityView(viewModel)
                    }
                    
                    MoonTrackerView(viewModel)
                    
                    HStack {
                        AveragesView(viewModel)
                        PressureView(viewModel)
                    }
                    
                    VStack {
                        Text("Weather for " + viewModel.cityName)
                            .font(.callout.bold())
                        
                        HStack(spacing: 3) {
                            Text("Here is the site from which I took the API")
                            
                            Button {
                                UIApplication.shared.open(URL(string: "https://www.weatherapi.com")!)
                            } label: {
                                Text("WeatherApi")
                                    .underline()
                            }
                        }
                        .font(.caption.bold())
                        .opacity(0.4)
                    }
                    .foregroundColor(.white)
                    .frame(height: 100)
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
