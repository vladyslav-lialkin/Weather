//
//  BackgroundView.swift
//  Weather
//
//  Created by Влад Лялькін on 21.05.2024.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

//#Preview {
//    BackgroundView(isNight: true)
//}
