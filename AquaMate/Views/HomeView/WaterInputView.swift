//
//  WaterInputView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/7/24.
//

import SwiftUI

struct WaterInputView: View {
    @Binding var showView: Bool
    @Binding var ouncesDrunk: Double
    @State private var waterDrunk: Double = 0
    
    var value: Int {
        Int(waterDrunk * 16)
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
                    ouncesDrunk = waterDrunk
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
    WaterInputView(showView: .constant(false), ouncesDrunk: .constant(0))
}
