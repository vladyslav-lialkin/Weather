//
//  DashCircle.swift
//  Weather
//
//  Created by Влад Лялькін on 09.06.2024.
//

import SwiftUI

struct DashCircle: Shape {
    let degrees: Int
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let dashLength: CGFloat = 8
        for i in 0..<360 {
            if i % degrees == 0 {
                let angle = CGFloat(i) * .pi / 180
                let start = CGPoint(
                    x: center.x + cos(angle) * (radius - dashLength),
                    y: center.y + sin(angle) * (radius - dashLength)
                )
                let end = CGPoint(
                    x: center.x + cos(angle) * radius,
                    y: center.y + sin(angle) * radius
                )
                path.move(to: start)
                path.addLine(to: end)
            }
        }
        return path
    }
}

#Preview {
    ZStack {
        Color.blue
            .ignoresSafeArea()
        
        DashCircle(degrees: 45)
            .stroke(Color.white, lineWidth: 1)
            .frame(width: 120, height: 120)
    }
}
