//
//  RegularButton.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/6/24.
//

import SwiftUI

struct CustomButtonLabel: View {
    let text: String
    let size: Double

    init(text: String = "DONE", size: Double = 20) {
        self.text = text
        self.size = size
    }
    
    var body: some View {
        Text(text)
            .padding()
            .padding(.horizontal, self.size / 2)
            .font(.system(size: size, weight: .heavy))
            .background(Color(.darkLabel))
            .foregroundStyle(Color(red: 225/255, green: 225/255, blue: 225/255))
            .clipShape(.rect(cornerRadius: 30))
    }
}

#Preview {
    CustomButtonLabel()
}
