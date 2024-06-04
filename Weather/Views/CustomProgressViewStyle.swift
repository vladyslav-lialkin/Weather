//
//  CustomProgressViewStyle.swift
//  Weather
//
//  Created by Влад Лялькін on 16.05.2024.
//

import SwiftUI

struct CustomProgressViewStyle: ProgressViewStyle {
    
    let range: ClosedRange<Double>
    let colors: [Color]
    let isShowProgressPoint: Bool
    
    let backgroundColor = Color(red: 0.25, green: 0.35, blue: 0.72, opacity: 0.2)

    var foregroundColor: LinearGradient {
        LinearGradient(colors: colors,
                       startPoint: .leading, endPoint: .trailing)
    }
    
    var fillWidthScale: Double {
        let normalizedRange = range.upperBound - range.lowerBound
        return Double(normalizedRange)
    }
    
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(backgroundColor)
                
                Capsule()
                    .fill(foregroundColor)
                    .frame(width: size.width * fillWidthScale)
                    .reverseMask {
                        if isShowProgressPoint {
                            Circle()
                                .frame(width: size.height + 4.0, height: size.height + 4.0)
                                .position(x: (size.width * (configuration.fractionCompleted ?? 0.0)) - (size.width * range.lowerBound), y: size.height/2.0)
                        }
                    }
                    .offset(x: size.width * range.lowerBound)
                
                if isShowProgressPoint {
                    Circle()
                        .foregroundStyle(.white)
                        .position(x: size.width * (configuration.fractionCompleted ?? 0.0), y: size.height/2.0)
                }
            }
            .clipped()
        }
    }
}

extension View {
    @inlinable
    public func reverseMask<Mask: View>(
        alignment: Alignment = .center,
        @ViewBuilder _ mask: () -> Mask
    ) -> some View {
        self.mask {
            Rectangle()
                .overlay(alignment: alignment) {
                    mask()
                        .blendMode(.destinationOut)
                }
        }
    }
}

#Preview {
    VStack {
        let range = 0.0...(Double(1.0))
        ProgressView(value: 0.5)
            .frame(height: 5)
            .progressViewStyle(CustomProgressViewStyle(range: range, colors: [.red], isShowProgressPoint: true))
    }
    .padding()
}
