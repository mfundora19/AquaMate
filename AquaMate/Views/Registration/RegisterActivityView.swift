//
//  RegisterActivityView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/6/24.
//

import SwiftUI

struct RegisterActivityView: View {
    @Binding var minExercised: Double
    @Binding var showActivityRange: Bool
    
    var body: some View {
        ZStack {
            Color(.bg3).ignoresSafeArea()
            
            VStack {
                // Slider with range from 10 to 180 minutes
                HStack {
                    Text("0 min")
                    Slider(value: $minExercised, in: 0...180, step: 1)
                        .padding()
                    Text("180 min")
                }
                
                // Display selected value
                Text("Selected Time: \(Int(minExercised)) min")
                    .font(.title)
                    .padding()
                
                
                Button {
                    showActivityRange = false
                }label: {
                    CustomButtonLabel(text: "DONE")
                }
            }
            .foregroundStyle(.black)
            .padding()
        }
    }
}

#Preview {
    RegisterActivityView(minExercised: .constant(0), showActivityRange: .constant(false))
}
