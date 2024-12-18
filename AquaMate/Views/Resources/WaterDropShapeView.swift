//
//  WaterDropShape.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/7/24.
//

import SwiftUI

struct WaterDropShapeView: View {
    var progress: CGFloat
    @State private var startAnimation: CGFloat = 0
    
    var body: some View {
        // Wave Form
        VStack {
            GeometryReader {proxy in
                let size = proxy.size
                
                // Water Drop
                ZStack {
                    Image(systemName: "drop.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.white)
                    
                        .scaleEffect(x:1.1, y:1) // Stretching in X axis
                    
                    
                    // Wave Form Shape
                    WaterWave(progress: progress, waveHeight: 0.05, offset: startAnimation)
                        .fill(.card)
                        .overlay { // Water Drops
                            Bubbles()
                        }
                        .mask { // Mask Into Drop Shape
                            Image(systemName: "drop.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(20)
                        }
                    
                    
                }
                .frame(width: size.width, height: size.height, alignment: .center)
                .onAppear { // Looping Animation
                    
                    withAnimation (.linear(duration: 5).repeatForever(autoreverses: false)){
                        startAnimation = size.width
                    }
                }
            }
            .frame(height: 350)
        }
    }
}


#Preview {
    WaterDropShapeView(progress: 0.5)
}

// MARK: - Wave Animation Shape
struct WaterWave: Shape {
    
    var progress: CGFloat
    var waveHeight: CGFloat
    
    var offset: CGFloat // Initial Animation Start
    
    var animatableData: CGFloat {
        get {offset}
        set {offset = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        return Path {path in
            path.move(to: .zero)
            
            // Drawing Waves using Sine
            let progressHeight: CGFloat = (1 - progress) * rect.height
            let height = waveHeight * rect.height
            
            for value in stride(from: 0, to: rect.width, by: 2) {
                let x: CGFloat = value
                let sine: CGFloat = sin(Angle(degrees: value + offset).radians)
                let y: CGFloat = progressHeight + (height * sine)
                
                path.addLine(to: CGPoint(x: x, y: y))
                
            }
            
            // Bottom Portion
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
        }
    }
}

// MARK: - Water Bubbles
struct Bubbles: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.white.opacity(0.1))
                .frame(width: 20, height: 20)
                .offset(x: -20)
            Circle()
                .fill(.white.opacity(0.1))
                .frame(width: 25, height: 25)
                .offset(x: 40, y: 30)
            Circle()
                .fill(.white.opacity(0.1))
                .frame(width: 35, height: 35)
                .offset(x: -30, y: 80)
            Circle()
                .fill(.white.opacity(0.1))
                .frame(width: 15, height: 15)
                .offset(x: 50, y: 70)
            Circle()
                .fill(.white.opacity(0.1))
                .frame(width: 10, height: 10)
                .offset(x: 40, y: 100)
            Circle()
                .fill(.white.opacity(0.1))
                .frame(width: 10, height: 10)
                .offset(x: -40, y: 50)
        }
    }
}
