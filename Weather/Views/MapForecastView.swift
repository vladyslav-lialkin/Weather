//
//  MapForecastView.swift
//  Weather
//
//  Created by Влад Лялькін on 27.05.2024.
//

import SwiftUI
import MapKit

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

struct MapRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.mapType = .mutedStandard
        mapView.overrideUserInterfaceStyle = .dark
        mapView.isRotateEnabled = false
        mapView.isScrollEnabled = false
        mapView.isZoomEnabled = false
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {}
}

#Preview {
    MapForecastView()
}
