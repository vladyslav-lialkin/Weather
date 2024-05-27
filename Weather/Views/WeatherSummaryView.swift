//
//  WeatherSummaryView.swift
//  Weather
//
//  Created by Влад Лялькін on 09.05.2024.
//

import SwiftUI

struct WeatherSummaryView: View {
    
    @EnvironmentObject private var weatherVM: WeatherViewModel
    @State private var startY: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            let minY = geometry.frame(in: .global).minY
            let adjustedYOffset = -(minY - startY) * 0.75
            let adjustedMinY = -(minY) > 0 ? -(minY) : 0
            let offset = -(minY + (startY*3)) < 0 ? adjustedYOffset : adjustedMinY
            let height = (geometry.size.height - offset)
            
            VStack(spacing: 0) {
                Text(weatherVM.cityName)
                    .font(.system(size: 32))
                    .frame(height: 32)
                ZStack(alignment: .top) {
                    Text(weatherVM.currentTemp + " | " + weatherVM.conditionText)
                        .font(.system(size: 22))
                        .fontWeight(.medium)
                        .opacity((adjustedMinY) <= 170 ? (adjustedMinY - 140) / 30.0 : 1.0)
                    
                    Text(weatherVM.currentTemp)
                        .font(.system(size: 100))
                        .fontWeight(.thin)
                        .frame(height: 100)
                        .opacity((height) <= 200 ? (height - 170) / 30.0 : 1.0)
                }
                Text(weatherVM.conditionText)
                    .font(.system(size: 22))
                    .fontWeight(.medium)
                    .frame(height: 22)
                    .opacity((height) <= 240 ? (height - 210) / 30.0 : 1.0)
                Text(weatherVM.highAndLowTemp)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .frame(height: 20)
                    .opacity((height) <= 270 ? (height - 240) / 30.0 : 1.0)
            }
            .onAppear {
                startY = geometry.frame(in: .global).minY
            }
            .shadow(radius: 2.0)
            .foregroundStyle(.white)
            .frame(width: 300, height: 315, alignment: .center)
            .offset(y: offset)
        }
        .frame(width: 300, height: 315, alignment: .center)
    }
}

#Preview {
    WeatherView()
        .environmentObject(WeatherViewModel())
}
