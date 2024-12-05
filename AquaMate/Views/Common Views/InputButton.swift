//
//  InputButton.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/5/24.
//

import SwiftUI

struct InputButton: View {
    let text: String
    let icon: String
    var set = false
    let action: () -> Void
    
    var body: some View {
        Button (action: action) {
            HStack {
                Text(text)
                Spacer()
                Image(systemName: icon)
            }
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .foregroundStyle(.white)
            .padding(20)
            .frame(width: 270, height: 56)
            .background(.base.opacity(set ? 1 : 0.5))
            .clipShape(.rect(cornerRadius: 30))
        }
        
    }
}

#Preview {
    InputButton(text: "Sex", icon: ButtonIcons.Name.rawValue, action: { })
}
