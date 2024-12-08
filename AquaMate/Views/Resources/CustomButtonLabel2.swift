//
//  SettingsConfigCardView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/7/24.
//

import SwiftUI

struct CustomButtonLabel2: View {
    let title: String
    let subtitle: String?
    let description: String
    let color: Color
    let foregroundColor: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 35)
            .fill(color)
            .frame(width: 370, height: 170)
            .overlay {
                HStack {
                    VStack (alignment: .leading) {
                        Text(title)
                            .foregroundStyle(foregroundColor)
                            .font(.system(size: 40, weight: .semibold, design: .rounded))
                            .padding(.bottom, 6)
                        
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(foregroundColor)
                                .font(.headline)
                        }
                        
                        Text(description)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundStyle(Color(uiColor: .gray))
                            .multilineTextAlignment(.leading)
                        
                    }
                    
                    Spacer()
                    
                    Image(systemName: K.ButtonIcons.ForwardButton.rawValue)
                        .font(.title)
                        .foregroundStyle(.darkLabel)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
    }
}

#Preview {
    CustomButtonLabel2(title: "50oz",
                           subtitle: "Custom goal",
                           description: "Change custom goal",
                           color: .base,
                           foregroundColor: .white)
}

#Preview {
    CustomButtonLabel2(title: "Reminders",
                           subtitle: nil,
                           description: "Healthy notifications when you forget to drink water",
                           color: .card2,
                           foregroundColor: .base)
}
