//
//  PressureView.swift
//  Weather
//
//  Created by Влад Лялькін on 13.06.2024.
//

import SwiftUI

struct PressureView: View {
    
//    @State private var hPa = 1012
    @State private var degreePosition = 125.0 //250.0
    
    @ObservedObject var viewModel: PressureViewModel
    
    var body: some View {
        CustomView(height: 180) {
            ZStack(alignment: .center) {
                DashCircle(degrees: 6, dashLength: 10)
                    .stroke(Color.white, lineWidth: 2)
                    .frame(width: 120, height: 120)
                    .rotationEffect(.degrees(147))
                    .opacity(0.12)
                    .overlay {
                        Circle()
                            .trim(from: 0.725, to: 0.775)
                            .stroke(Color.white, lineWidth: 10)
                            .frame(width: 110, height: 110)
                            .blur(radius: 10)
                            .rotationEffect(.degrees(-123))
                            .rotationEffect(.degrees(viewModel.degreePosition))
                    }
                    .mask {
                        Circle()
                            .trim(from: 0.0, to: 0.7)
                            .stroke(Color.white, lineWidth: 10)
                            .frame(width: 110, height: 110)
                            .rotationEffect(.degrees(146))
                    }

                VStack {
                    Rectangle()
                        .frame(width: 3, height: 16)
                        .clipShape(.rect(cornerRadius: 3))
                        .padding(.top, 10.5)
                    
                    Spacer()
                }
                .rotationEffect(.degrees(-123))
                .rotationEffect(.degrees(viewModel.degreePosition))
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("Low")
                        Spacer()
                        Text("High")
                        Spacer()
                    }
                    .font(.system(size: 15))
                }
                .padding(.bottom)
                
                VStack(spacing: 1) {
                    Image(systemName: "equal")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 10)
                        .font(.title3.bold())
                    
                    Text("\(viewModel.pressure)")
                        .font(.title3.bold())
                    
                    Text("hPa")
                        .font(.system(size: 15))
                }
            }
            .foregroundStyle(.white)
            .padding(.horizontal)
        } header: {
            Label("PRESSURE", systemImage: "gauge.with.dots.needle.bottom.50percent")
        }
    }
    
    init(_ viewModel: WeatherViewModel) {
        self.viewModel = PressureViewModel(viewModel: viewModel)
    }
}

#Preview {
    HStack {
        PressureView(WeatherViewModel())
        PressureView(WeatherViewModel())
    }
}
