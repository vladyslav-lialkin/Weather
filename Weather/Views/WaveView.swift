//
//  WaveView.swift
//  Weather
//
//  Created by Влад Лялькін on 30.05.2024.
//

import SwiftUI

struct WaveView: View {

    var body: some View {
        ZStack {
            GeometryReader { proxy in
                Wave()
                    .stroke(.ultraThinMaterial, lineWidth: 4.5)
                    .colorScheme(.dark)
                    .opacity(0.8)
                
                Wave()
                    .stroke(LinearGradient(colors: [.gray, .white, .white, .gray], startPoint: .leading, endPoint: .trailing),
                            lineWidth: 4.5)
                    .opacity(0.30)
                    .mask {
                        GeometryReader { innerProxy in
                            Rectangle()
                                .frame(width: innerProxy.size.width, height: innerProxy.size.height/1.80)
                        }
                    }
                
                Rectangle()
                    .frame(height: 1.2)
                    .foregroundStyle(.white).blur(radius: 1.0)
                    .position(CGPoint(x: proxy.size.width/2.0, y: proxy.size.height/1.80))
                    .mask {
                        Rectangle()
                            .frame(height: 1.2)
                            .position(CGPoint(x: proxy.size.width/2.0, y: proxy.size.height/1.80))
                    }
                
                Circle()
                    .frame(width: 12)
                    .foregroundStyle(Color(uiColor: .darkGray))
                    .overlay {
                        Circle()
                            .stroke(.white)
                            .frame(width: 12)
                    }
                    .position(Wave.point(
                        for: xPoint(proxy: proxy),
                        in: CGRect(origin: CGPoint.zero, size: proxy.size))
                    )
                
                Circle()
                    .frame(width: 12)
                    .foregroundStyle(.white)
                    .shadow(color: .white, radius: 10)
                    .blur(radius: 5.0)
                    .overlay {
                        Circle()
                            .frame(width: 12)
                            .foregroundStyle(.white)
                    }
                    .position(Wave.point(
                        for: xPoint(proxy: proxy),
                        in: CGRect(origin: CGPoint.zero, size: proxy.size))
                    )
                    .reverseMask {
                        Rectangle()
                            .offset(y: (proxy.size.height / 1.80))
                    }
            }
        }
    }
    
    private func xPoint(proxy: GeometryProxy) -> CGFloat {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)

        return CGFloat(12) * (proxy.size.width / 24)
    }
}

struct Wave: Shape {
    
    static func point(for x: CGFloat, in rect: CGRect) -> CGPoint {
        let frequency = 1 * (2 * 3.1415)
        let wavelength = rect.width / CGFloat(frequency)
        let relativeX = x / wavelength
        let y = (cos(relativeX) * 18) + rect.midY
        return CGPoint(x: x, y: y)
    }
    
    func path(in rect: CGRect) -> Path {
        let frequency = 1 * (2 * 3.1415)
        let width = rect.width
        let wavelength = rect.width / CGFloat(frequency)
        
        let startPoint = CGPoint(x: rect.minX, y: rect.midY)
        let path = UIBezierPath()
        
        path.move (to: startPoint)
        
        for x in stride(from: 0, through: width, by: 1) {
            let relativeX = x / wavelength
            let y = (cos(relativeX) * 18) + startPoint.y
            let point = CGPoint(x: x, y: y)
            
            if x == 0 {
                path.move(to: point)
                continue
            }

            path.addLine(to: point)
        }
        
        return Path(path.cgPath)
    }
}

#Preview {
    HStack {
        WaveView()
            .frame(height: 170, alignment: .leading)
            .padding(.horizontal, 5)
        WaveView()
            .frame(height: 170, alignment: .leading)
            .padding(.horizontal, 5)
    }
    .padding()
    .background {
        Color.blue
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .ignoresSafeArea()
    }
}
