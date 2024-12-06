//
//  RegisterWeightView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/6/24.
//

import SwiftUI

struct RegisterWeightView: View {
    @Binding var weight: Double
    @Binding var showWeightPicker: Bool
    
    @State private var wholeWeight: Int = 70
    @State private var decimalWeight: Int = 0
    
    private let numbers = Array(70...300)
    private let decimals = Array(0...9)
    
    
    var body: some View {
        ZStack {
            Color(.bg3).ignoresSafeArea()
            
            VStack {
                HStack (spacing: 0){
                    Picker("Select your Weight", selection: $wholeWeight) {
                        ForEach(numbers, id:\.self) {number in
                            Text("\(number)")
                                .foregroundStyle(.black)
                                .tag(number)
                        }
                    }
                    .frame(width: 150)
                    Picker("Select decimal Weight", selection: $decimalWeight) {
                        ForEach(decimals, id:\.self) {decimal in
                            Text(".\(decimal)")
                                .foregroundStyle(.black)
                                .tag(decimal)
                        }
                    }
                    .frame(width: 150)
                }
                .onChange(of: wholeWeight){ _, _ in updateWeight()}
                .onChange(of: decimalWeight) {_, _ in updateWeight()}
                .pickerStyle(.wheel)
                .padding()
                

                
                
                Button {
                    showWeightPicker = false
                }label: {
                    RegularButtonLabel(text: "DONE")
                }
            }
        }
    }
    
    
    // Function to update the weight when any of the wheel values changes
    private func updateWeight() {
        weight = Double(wholeWeight) + Double(decimalWeight) / 10.0
    }
}

#Preview {
    RegisterWeightView(weight: .constant(0), showWeightPicker: .constant(false))
}
