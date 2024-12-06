//
//  RegisterNameView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/5/24.
//

import SwiftUI

struct RegisterNameView: View {
    @Binding var name: String
    @Binding var nameDone: Bool
    
    var body: some View {
        VStack {
            // TextField
            PersonalizedTextFieldView(name: $name,
                                      placeholderText: "Enter your name")
        }
    }
}

#Preview {
    RegisterNameView(name: .constant(""), nameDone: .constant(true))
}


