//
//  MapForecastView.swift
//  Weather
//
//  Created by Влад Лялькін on 27.05.2024.
//

import SwiftUI

struct MapForecastView: View {
    var body: some View {
        CustomView(height: 350) {
            MapRepresentable()
                .frame(height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 7.0))
                .padding(.horizontal)
        } header: {
            Label("PRECIPITATION", systemImage: "umbrella.fill")
        }

    }
}

#Preview {
    MapForecastView()
}
