//
//  FeelsLikeView.swift
//  Weather
//
//  Created by Влад Лялькін on 10.06.2024.
//

import SwiftUI

struct FeelsLikeView: View {
    
    @ObservedObject var viewModel: FeelsLikeViewModel
    
    var body: some View {
        CustomView(height: 170) {
            VStack(alignment: .leading, spacing: 5) {
                Text(viewModel.feelsLikeC)
                    .font(.largeTitle)
                    .frame(alignment: .top)
                    .padding(.top, 3)
                
                Spacer()
                Spacer()
                Spacer()
                
                Text(viewModel.feelsLikeDescription)
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
        self.viewModel = FeelsLikeViewModel(viewModel: viewModel)
    }
}

#Preview {
    FeelsLikeView(WeatherViewModel())
}
