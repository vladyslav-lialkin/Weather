//
//  PrecipitationView.swift
//  Weather
//
//  Created by Влад Лялькін on 11.06.2024.
//

import SwiftUI

struct PrecipitationView: View {
    
    @ObservedObject var viewModel: PrecipitationViewModel
    
    var body: some View {
        CustomView(height: 170) {
            VStack(alignment: .leading, spacing: 5) {
                Text(viewModel.precipMm)
                    .font(.largeTitle)
                    .frame(alignment: .top)
                    .padding(.top, 3)
                
                Spacer()
                Spacer()
                Spacer()
                
                Text(viewModel.precipMmDescription)
                    .font(.system(size: 15))
                    .frame(height: 36, alignment: .bottom)
                    .padding(.bottom)
            }
            .foregroundStyle(.white)
            .padding(.horizontal)
        } header: {
            Label("FEELS LIKE", systemImage: "thermometer.medium")
        }
    }
    
    init(_ viewModel: WeatherViewModel) {
        self.viewModel = PrecipitationViewModel(viewModel: viewModel)
    }
}

#Preview {
    PrecipitationView(WeatherViewModel())
}
