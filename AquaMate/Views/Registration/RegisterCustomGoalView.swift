//
//  RegisterCustomGoalView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/6/24.
//

import SwiftUI

struct RegisterCustomGoalView: View {
    @Binding var showCustomGoal: Bool
    @Binding var customGoal: Int
    @State private var strGoal = ""
    
    var body: some View {
        ZStack {
            Color(.bg3).ignoresSafeArea()
            
            VStack {
                HStack {
                    TextField("Enter your goal", text: $strGoal)
                        .keyboardType(.numberPad)
                        .onAppear {
                            strGoal = "\(customGoal)" // Display the customGoal 
                        }
                        .onChange(of: strGoal) { _ , newValue in
                            // Take only numbers
                            let filtered = newValue.filter {$0.isNumber}
                            
                            if filtered.count <= 3 {
                                strGoal = filtered
                            } else {
                                strGoal = String(filtered.prefix(3))
                            }
                            
                            // Set the input entered to the binding
                            if let goal = Int(strGoal) {
                                customGoal = goal
                            }
                        }
                        .multilineTextAlignment(.center)
                        .frame(width: 58)
                    Text("oz")
                }
                .padding(.top)
                .font(.system(size: 30, weight: .bold, design: .rounded))

                Text("Custom goal")
                    .font(.headline)
                
                Button {
                    showCustomGoal = false
                } label: {
                    RegularButtonLabel()
                }
                    .padding(.vertical, 24)
            }
            .foregroundStyle(.darkLabel)
            .frame(width: 150)
            
        }
    }
}

#Preview {
    RegisterCustomGoalView(showCustomGoal: .constant(false), customGoal: .constant(62))
}
