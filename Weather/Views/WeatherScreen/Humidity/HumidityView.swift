//
//  HumidityView.swift
//  Weather
//
//  Created by Влад Лялькін on 11.06.2024.
//

import SwiftUI

struct HumidityView: View {
    
    @ObservedObject var viewModel: HumidityViewModel
    
    var body: some View {
        CustomView(height: 170) {
            VStack(alignment: .leading, spacing: 5) {
                Text(viewModel.humidity)
                    .font(.largeTitle)
                    .frame(alignment: .top)
                    .padding(.top, 3)
                                                
                Text(viewModel.humidityDescription)
                    .font(.system(size: 15))
                    .frame(height: 75, alignment: .bottom)
                    .padding(.bottom)
            }
            .foregroundStyle(.white)
            .padding(.horizontal)
        } header: {
            Label("HUMIDITY", systemImage: "humidity.fill")
        }
    }
    
    init(_ viewModel: WeatherViewModel) {
        self.viewModel = HumidityViewModel(viewModel: viewModel)
    }
}

#Preview {
    VisibilityView(WeatherViewModel())
}
