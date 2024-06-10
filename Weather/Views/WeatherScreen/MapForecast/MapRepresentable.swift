//
//  MapRepresentable.swift
//  Weather
//
//  Created by Влад Лялькін on 09.06.2024.
//

import SwiftUI
import MapKit

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
