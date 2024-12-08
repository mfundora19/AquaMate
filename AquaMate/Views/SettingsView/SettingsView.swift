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
            
            VStack {
                List {
                    
                }
            }
            
            
            
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
