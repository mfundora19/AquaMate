//
//  CustomToggleView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/8/24.
//

import SwiftUI

struct CustomToggleView: View {
    let title: String
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
            Spacer()
            
            HStack {
                Text(isOn ? "On" : "Off")
                    .foregroundStyle(.base)
                Toggle("", isOn: $isOn)
                    .toggleStyle(SwitchToggleStyle(tint: .base))
                    .labelsHidden()
            }
            
        }.padding()
        .frame(height: 100)
        .background(.secondary)
        .clipShape(.rect(cornerRadius: 30))
        
    }
}

#Preview {
    CustomToggleView(title: "Reminders", isOn: .constant(false))
}
