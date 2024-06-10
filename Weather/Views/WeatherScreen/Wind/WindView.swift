//
//  WindView.swift
//  Weather
//
//  Created by Влад Лялькін on 06.06.2024.
//

import SwiftUI

struct WindView: View {
    
    @ObservedObject var viewModel: WindViewModel
    
    var body: some View {
        CustomView(height: 170) {
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(viewModel.windMps)
                            .font(.system(size: 43))
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("M/S")
                                .font(.caption.bold())
                                .opacity(0.3)
                            Text("Wind")
                                .font(.callout.bold())
                        }
                    }
                    
                    Divider()
                        .background(.white)
                        .opacity(0.3)
                        .padding(.trailing)
                    
                    HStack {
                        Text(viewModel.gustMps)
                            .font(.system(size: 43))
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("M/S")
                                .font(.caption.bold())
                                .opacity(0.3)
                            Text("Gusts")
                                .font(.callout.bold())
                        }
                        .font(.callout.bold())
                    }
                }
                .foregroundStyle(.white)
                
                WindCompassView(windDegree: viewModel.windDegree,
                                windDir: viewModel.windDir)
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
        } header: {
            Label("WIND", systemImage: "wind")
        }
    }
    
    init(_ viewModel: WeatherViewModel) {
        self.viewModel = WindViewModel(viewModel: viewModel)
    }
}

#Preview {
    WeatherView()
        .environmentObject(WeatherViewModel())
}
