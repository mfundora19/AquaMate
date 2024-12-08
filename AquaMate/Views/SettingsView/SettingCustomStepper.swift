//
//  SettingCustomStepper.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/8/24.
//

import SwiftUI

struct SettingCustomStepper: View {
    @Binding var value: Double
    
    // Constants
    private let minValue: Double = 30 * 60   // 30 minutes in seconds
    private let maxValue: Double = 4 * 60 * 60 // 4 hours in seconds
    private let step: Double = 30 * 60       // 30 minutes in seconds
    
    var body: some View {
        HStack {
            Button(action: decrement) {
                Image(systemName: "minus.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(value > minValue ? .blue : .gray)
            }
            .disabled(value <= minValue)
            
            Spacer()
            
            Text("\(formattedTime)")
                .font(.title2)
                .foregroundStyle(.base)
                .fontWeight(.semibold)
                .frame(minWidth: 120, alignment: .center)
            
            Spacer()
            
            Button(action: increment) {
                Image(systemName: "plus.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(value < maxValue ? .blue : .gray)
            }
            .disabled(value >= maxValue)
        }
        .padding()
        .frame(height: 100)
        .background(.bg3)
        .clipShape(.rect(cornerRadius: 30))
    }
    
    //MARK: - Helper Methods
    
    // Helper to format the time as hours and minutes
    private var formattedTime: String {
        let hours = Int(value) / 3600
        let minutes = (Int(value) % 3600) / 60
        return "\(hours)h \(minutes)m"
    }
    
    // Decrement the value
    private func decrement() {
        let newValue = value - step
        value = max(newValue, minValue)
    }
    
    // Increment the value
    private func increment() {
        let newValue = value + step
        value = min(newValue, maxValue)
    }
}


#Preview {
    SettingCustomStepper(value: .constant(1800))
}
