//
//  ArrowShape.swift
//  Weather
//
//  Created by Влад Лялькін on 09.06.2024.
//

import SwiftUI

struct ArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY * 0.8))
        return path
    }
}

#Preview {
    ArrowShape()
        .fill(.black)
        .frame(width: 8, height: 10)
        .clipShape(.rect(cornerRadius: 2))
}
