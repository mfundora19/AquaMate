//
//  SettingsView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/7/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.bg3.ignoresSafeArea()
            
            VStack (spacing: 25){
                Button {
                    
                } label: {
                    CustomButtonLabel2(title: "Reminders",
                                    subtitle: nil,
                                    description: "Healthy notifications when you forget to drink water",
                                    color: .card2,
                                    foregroundColor: .base)
                }
                
                Button {
                    
                } label: {
                    CustomButtonLabel2(title: "50oz",
                                    subtitle: "Custom goal",
                                    description: "Change custom goal",
                                    color: .base,
                                    foregroundColor: .white)
                }
                
                Spacer()
                
            }.padding()
            
            
            
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button{
                    dismiss()
                } label: {
                    Image(systemName: K.ButtonIcons.BackButton.rawValue)
                        .font(.title)
                        .foregroundStyle(.base)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
