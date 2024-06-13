//
//  AveragesView.swift
//  Weather
//
//  Created by Влад Лялькін on 13.06.2024.
//

import SwiftUI

struct AveragesView: View {
    
    @ObservedObject var viewModel: AveragesViewModel
    
    var body: some View {
        CustomView(height: 180) {
            VStack(alignment: .leading, spacing: 5) {
                Text(viewModel.maxMinusAvgC)
                    .font(.largeTitle)
                    .frame(alignment: .top)
                    .padding(.top, 3)
                
                Text(viewModel.maxMinusAvgCDescription)
                    .font(.callout.bold())
                    .frame(height: 45)
                    .padding(.top, -3)
                
                VStack(spacing: 0) {
                    HStack {
                        Text("Today")
                            .opacity(0.3)
                            .font(.callout.weight(.regular))
                        Spacer()
                        Text(viewModel.todayMaxTempC)
                    }
                    HStack {
                        Text("Average")
                            .opacity(0.3)
                            .font(.callout.weight(.regular))
                        Spacer()
                        Text(viewModel.averageTempC)
                    }
                }
                .font(.callout.bold())
            }
            .foregroundStyle(.white)
            .padding(.horizontal)
        } header: {
            Label("AVERAGES", systemImage: "chart.line.uptrend.xyaxis")
        }
    }
    
    init(_ viewModel: WeatherViewModel) {
        self.viewModel = AveragesViewModel(viewModel: viewModel)
    }
}

#Preview {
    AveragesView(WeatherViewModel())
}
