//
//  RegisterWeightView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/6/24.
//

import SwiftUI

struct RegisterWeightView: View {
    @Binding var weight: Int
    @Binding var showWeightPicker: Bool
    private let numbers = Array(70...300)
    
    var body: some View {
        ZStack {
            Color(.bg3).ignoresSafeArea()
            
            VStack {
                Picker("Select your Weight", selection: $weight) {
                    ForEach(numbers, id:\.self) {number in
                        Text("\(number)")
                            .foregroundStyle(.black)
                            .tag(number)
                    }
                }
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
}

#Preview {
    RegisterWeightView(weight: .constant(0), showWeightPicker: .constant(false))
}
