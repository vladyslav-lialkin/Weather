//
//  MoonTrackerView.swift
//  Weather
//
//  Created by Влад Лялькін on 12.06.2024.
//

import SwiftUI

struct MoonTrackerView: View {
    
    @ObservedObject var viewModel: MoonTrackerViewModel
    
    var body: some View {
        CustomView(height: 170) {
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("Illumination")
                        
                        Spacer()
                        
                        Text(viewModel.illumination)
                            .opacity(0.3)
                    }
                    
                    Divider()
                        .background(.white)
                        .opacity(0.3)
                    
                    HStack {
                        Text(viewModel.getCurrentMoonCycle().string)
                        
                        Spacer()

                        Text(viewModel.getCurrentMoonCycle().number)
                            .opacity(0.3)
                    }
                    
                    Divider()
                        .background(.white)
                        .opacity(0.3)
                    
                    HStack {
                        Text(viewModel.getNextMoonCycle().string)
                        
                        Spacer()

                        Text(viewModel.getNextMoonCycle().number)
                            .opacity(0.3)
                    }
                }
                .foregroundStyle(.white)
                .padding(.trailing)
                
                Image("Moon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .opacity(0.4)
                    .padding(.bottom, 10)
            }
            .font(.callout.weight(.regular))
            .padding(.horizontal)
        } header: {
            Label(viewModel.moonPhase, systemImage: "moonphase.waxing.crescent.inverse")
        }
    }
    
    init(_ viewModel: WeatherViewModel) {
        self.viewModel = MoonTrackerViewModel(viewModel: viewModel)
    }
}

#Preview {
    MoonTrackerView(WeatherViewModel())
}
