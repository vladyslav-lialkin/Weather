//
//  CustomView.swift
//  Weather
//
//  Created by Влад Лялькін on 01.05.2024.
//

import SwiftUI

struct CustomView<Content: View, Header: View>: View {
    var height: CGFloat
    
    @ViewBuilder var content: Content
    @ViewBuilder var header: Header
    
    var body: some View {
        GeometryReader { geometry in
            let minY = geometry.frame(in: .global).minY
            let offset = -(minY - 140) > 0 ? -(minY - 140) : 0
            let height = (geometry.size.height - offset)
            
            RoundedRectangle(cornerRadius: 15.0)
                .background(.thinMaterial)
                .opacity(0.8)
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                .frame(height: (height) <= 35 ? 35 : height, alignment: .bottom)
                .offset(y: offset)
                .overlay {
                    GeometryReader {_ in
                        VStack(alignment: .leading) {
                            header
                                .padding(.top, 10)
                                .font(.caption.bold())
                                .foregroundStyle(.white)
                                .opacity(0.3)
                                .offset(y: offset)
                                .padding(.horizontal)
                            content
                                .mask {
                                    Rectangle()
                                        .offset(y: offset)
                                }
                        }
                    }
                }
                .opacity((height) <= 35 ? (height) / 35.0 : 1.0)
        }
        .frame(height: height)
    }
}

#Preview {
    WeatherView()
        .environmentObject(WeatherViewModel())
}
