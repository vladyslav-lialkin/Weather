//
//  WindCompassView.swift
//  Weather
//
//  Created by Влад Лялькін on 09.06.2024.
//

import SwiftUI

struct WindCompassView: View {
    
    @State var windDegree: Double
    @State var windDir: String
    
    var body: some View {
        ZStack {
            DashCircle(degrees: 3)
                .stroke(Color.white, lineWidth: 1)
                .opacity(0.12)
            
            DashCircle(degrees: 30)
                .stroke(Color.white, lineWidth: 1)
                .opacity(0.08)
            
            DashCircle(degrees: 90)
                .stroke(Color.white, lineWidth: 2)
                .opacity(0.11)
            
            VStack{
                Image(systemName: "triangleshape.fill")
                    .resizable()
                    .frame(width: 8, height: 8)
                    .foregroundStyle(.thinMaterial)
                    .brightness(-0.15)
                Spacer()
            }
            
            VStack {
                Text("N")
                    .padding(.top, 8)
                Spacer()
                Text("S")
                    .padding(.bottom, 8)
            }
            .font(.caption.bold())
            .foregroundStyle(.thinMaterial)
            .brightness(-0.15)

            HStack {
                Text("W")
                    .padding(.leading, 10)
                Spacer()
                Text("E")
                    .padding(.trailing, 10)
            }
            .font(.caption.bold())
            .foregroundStyle(.thinMaterial)
            .brightness(-0.15)

            Circle()
                .frame(width: 50)
                .foregroundStyle(.white)
                .shadow(color: .black, radius: 6)
                                
            VStack(spacing: 0){
                ArrowShape()
                    .fill(.white)
                    .frame(width: 8, height: 10)
                    .clipShape(.rect(cornerRadius: 2))
                Rectangle()
                    .frame(width: 2)
                    .padding(.top, -5)
                
                Circle()
                    .stroke(.white, lineWidth: 2.0)
                    .frame(width: 5)
                    .padding(.bottom, 1.5)
            }
            .foregroundStyle(.white)
            .rotationEffect(.degrees(180))
            .rotationEffect(.degrees(windDegree))
        }
        .frame(width: 120, height: 120)
        .reverseMask {
            Circle()
                .frame(width: 65)
        }
        .overlay {
            Text(windDir).bold()
                .font(.title3)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    ZStack {
        Color.blue
            .ignoresSafeArea()
        
        WindCompassView(windDegree: 320, windDir: "WNW")
    }
}
