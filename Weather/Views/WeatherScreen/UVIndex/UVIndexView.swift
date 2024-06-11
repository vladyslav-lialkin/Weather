//
//  UVIndexView.swift
//  Weather
//
//  Created by Влад Лялькін on 28.05.2024.
//

import SwiftUI

struct UVIndexView: View {
    
    @ObservedObject var viewModel: UVIndexViewModel
    
    var body: some View {
        CustomView(height: 170) {
            VStack(alignment: .leading, spacing: 5) {
                Text(viewModel.uv)
                    .font(.largeTitle)
                    .padding(.top, 3)
                
                Text(viewModel.shortDescripiton)
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding(.top, -7)

                ProgressView(value: viewModel.getProgressValue())
                    .progressViewStyle(CustomProgressViewStyle(
                        range: 0.0...1.0,
                        colors: [.green, .yellow, .red, .purple],
                        isShowProgressPoint: true)
                    )
                    .frame(height: 4.5)
                    .padding(.top, 5)
                
                Text(viewModel.longDescripiton)
                    .font(.system(size: 15))
                    .frame(height: 36)
                    .padding(.top, 3)
                    .padding(.bottom)
            }
            .foregroundStyle(.white)
            .padding(.horizontal)
        } header: {
            Label("UV INDEX", systemImage: "sun.max")
        }
    }
    
    init(_ viewModel: WeatherViewModel) {
        self.viewModel = UVIndexViewModel(viewModel: viewModel)
    }
}

#Preview {
    WeatherView()
        .environmentObject(WeatherViewModel())
}
