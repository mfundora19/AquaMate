//
//  HomeWaterDropView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/7/24.
//

import SwiftUI
/// A view that displays different content based on whether the user has achieved their daily goal.
///
/// - If the `dailyGoalCompleted` flag is true, it shows a congratulatory message and an image.
/// - If the `dailyGoalCompleted` flag is false, it shows a water drop shape to indicate progress.
/// 
struct HomeWaterDropView: View {
    var progress: CGFloat
    var dailyGoalCompleted: Bool
    
    var body: some View {
        if dailyGoalCompleted {
            VStack {
                Image(.waterDropCompleted)
                VStack {
                    Text("🎉 Congratulations 🎉")
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                    Text("Daily Goal Achieved")
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                }
                .foregroundStyle(.darkLabel)
            }
            .padding()
            .transition(.blurReplace)
        } else {
            WaterDropShapeView(progress: progress)
                .transition(.identity)
        }
    }
}

#Preview {
    HomeWaterDropView(progress: 0, dailyGoalCompleted: false)
}
