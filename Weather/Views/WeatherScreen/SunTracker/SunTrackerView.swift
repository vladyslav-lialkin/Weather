//
//  SunTrackerView.swift
//  Weather
//
//  Created by Влад Лялькін on 30.05.2024.
//

import SwiftUI

struct SunTrackerView: View {
    
    @ObservedObject var viewModel: SunTrackerViewModel
    
    var body: some View {
        CustomView(height: 170) {
            ZStack(alignment: .leading) {
                WaveView()
                    .padding(.top, 10)
                    .frame(height: 140)
                
                VStack(alignment: .leading) {
                    Text(viewModel.currentSunCycle.time)
                        .font(.largeTitle)
                        .padding(.top, 3)
                        .padding(.leading)
                    
                    Spacer()
                    
                    Text(viewModel.getNextSunCycle())
                        .font(.system(size: 15))
                        .padding(.leading)
                        .padding(.bottom)
                }
                .foregroundStyle(.white)
            }
        } header: {
            if viewModel.currentSunCycle.isSunrise {
                Label("SUNRISE", systemImage: "sunrise.fill")
            } else {
                Label("SUNSET", systemImage: "sunset.fill")
            }
        }
    }
    
    init(_ viewModel: WeatherViewModel) {
        self.viewModel = SunTrackerViewModel(viewModel: viewModel)
    }
}

#Preview {
    WeatherView()
        .environmentObject(WeatherViewModel())
}
