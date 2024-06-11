//
//  VisibilityView.swift
//  Weather
//
//  Created by Влад Лялькін on 11.06.2024.
//

import SwiftUI

struct VisibilityView: View {
    
    @ObservedObject var viewModel: VisibilityViewModel
    
    var body: some View {
        CustomView(height: 170) {
            VStack(alignment: .leading, spacing: 5) {
                Text(viewModel.visibilityKm)
                    .font(.largeTitle)
                    .frame(alignment: .top)
                    .padding(.top, 3)
                                                
                Text(viewModel.visibilityKmDescription)
                    .font(.system(size: 15))
                    .frame(height: 75, alignment: .bottom)
                    .padding(.bottom)
            }
            .foregroundStyle(.white)
            .padding(.horizontal)
        } header: {
            Label("VISIBILITY", systemImage: "eye.fill")
        }
    }
    
    init(_ viewModel: WeatherViewModel) {
        self.viewModel = VisibilityViewModel(viewModel: viewModel)
    }
}

#Preview {
    VisibilityView(WeatherViewModel())
}
