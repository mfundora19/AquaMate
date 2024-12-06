//
//  RegularButton.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/6/24.
//

import SwiftUI

struct RegularButtonLabel: View {
    let text: String
    var body: some View {
        Text(text)
            .padding()
            .padding(.horizontal, 10)
            .font(.system(size: 20, weight: .heavy))
            .background(Color(red: 1/255, green: 31/255, blue: 63/255))
            .foregroundStyle(Color(red: 225/255, green: 225/255, blue: 225/255))
            .clipShape(.rect(cornerRadius: 30))
    }
}

#Preview {
    RegularButtonLabel(text: "DONE")
}
