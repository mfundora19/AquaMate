//
//  WaterInputView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/7/24.
//

import SwiftUI

struct HomeWaterInputView: View {
    @Binding var showView: Bool
    @Binding var ouncesDrunk: Double
    @State private var waterDrunk: Double = 0
    private let scale = 16.0 // Slider Scale
    var notificationTime: Double?
    
    var value: Int {
        Int(waterDrunk * scale)
    }
    
    var body: some View {
        ZStack {
            Color.bg3.ignoresSafeArea()
            
            VStack {
                CustomColoredSlider(width: 80, height: 400, theValue: $waterDrunk)
                    .padding()
                Text("\(value) oz")
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                    .foregroundStyle(Color.darkLabel)
                Button {
                    showView = false
                    ouncesDrunk = waterDrunk * scale
                    
                    // Schedule a notification 
                    NotificationManager.shared.scheduleNotification(in: notificationTime)
                }
                label: {
                    CustomButtonLabel()
                        .padding(.top, 20)
                }
            }
        }
    }
}

#Preview {
    HomeWaterInputView(showView: .constant(false), ouncesDrunk: .constant(0), notificationTime: 3600)
}
