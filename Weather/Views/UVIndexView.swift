//
//  UVIndexView.swift
//  Weather
//
//  Created by Влад Лялькін on 28.05.2024.
//

import SwiftUI

struct UVIndexView: View {
    
    @EnvironmentObject private var weatherVM: WeatherViewModel
    
    var body: some View {
        CustomView(height: 170) {
            VStack(alignment: .leading, spacing: 5) {
                Text("\(Int(weatherVM.hourlyForecast.first?.uv ?? 0))")
                    .font(.largeTitle)
                    .padding(.top, 3)
                
                Text(weatherVM.hourlyForecast.first?.getUVSubtitle().0 ?? "")
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding(.top, -7)
                
                let value = (weatherVM.hourlyForecast.first?.uv ?? 0)/11
                let adjustedValue = value <= 0.02 ? 0.02 : (value == 1.0 ? 0.98 : value)
                ProgressView(value: adjustedValue)
                    .progressViewStyle(CustomProgressViewStyle(
                        range: 0.0...1.0,
                        colors: [.green, .yellow, .red, .purple],
                        isShowProgressPoint: true)
                    )
                    .frame(height: 4.5)
                    .padding(.top, 5)
                
                Text(weatherVM.hourlyForecast.first?.getUVSubtitle().1 ?? "")
                    .font(.system(size: 15))
                    .frame(height: 36)
                    .padding(.bottom)
            }
            .foregroundStyle(.white)
            .padding(.horizontal)
        } header: {
            Label("UV INDEX", systemImage: "sun.max")
        }
    }
}

#Preview {
    WeatherView()
        .environmentObject(WeatherViewModel())
}
