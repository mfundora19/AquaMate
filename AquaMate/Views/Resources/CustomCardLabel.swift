//
//  SettingsConfigCardView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/7/24.
//

import SwiftUI

struct CustomCardLabel: View {
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
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
    }
}

#Preview {
    CustomCardLabel(title: "50oz",
                           subtitle: "Custom goal",
                           description: "Change custom goal",
                           color: .base,
                           foregroundColor: .white)
}

#Preview {
    CustomCardLabel(title: "Reminders",
                           subtitle: nil,
                           description: "Healthy notifications when you forget to drink water",
                           color: .card2,
                           foregroundColor: .base)
}
