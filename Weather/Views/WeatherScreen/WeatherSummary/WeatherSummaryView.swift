//
//  WeatherSummaryView.swift
//  Weather
//
//  Created by Влад Лялькін on 09.05.2024.
//

import SwiftUI

struct WeatherSummaryView: View {
    
    @ObservedObject var viewModel: WeatherSummaryViewModel
    @State private var startY: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            let minY = geometry.frame(in: .global).minY
            let adjustedYOffset = -(minY - startY) * 0.75
            let adjustedMinY = -(minY) > 0 ? -(minY) : 0
            let offset = -(minY + (startY*3)) < 0 ? adjustedYOffset : adjustedMinY
            let height = (geometry.size.height - offset)
            
            VStack(spacing: 0) {
                Text(viewModel.cityName)
                    .font(.system(size: 32))
                    .frame(height: 32)
                
                ZStack(alignment: .top) {
                    Text(viewModel.currentTempAndConditionText)
                        .font(.system(size: 22))
                        .fontWeight(.medium)
                        .opacity(viewModel.getOpacityValue(adjustedMinY, 170, 140))
                    
                    Text(viewModel.currentTemp)
                        .font(.system(size: 100))
                        .fontWeight(.thin)
                        .frame(height: 100)
                        .opacity(viewModel.getOpacityValue(height, 200, 170))
                }
                
                Text(viewModel.conditionText)
                    .font(.system(size: 22))
                    .fontWeight(.medium)
                    .frame(height: 22)
                    .opacity(viewModel.getOpacityValue(height, 240, 210))

                Text(viewModel.highAndLowTemp)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .frame(height: 20)
                    .opacity(viewModel.getOpacityValue(height, 270, 240))
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
    
    init(_ viewModel: WeatherViewModel) {
        self.viewModel = WeatherSummaryViewModel(viewModel: viewModel)
    }
}

#Preview {
    WeatherView()
        .environmentObject(WeatherViewModel())
}
