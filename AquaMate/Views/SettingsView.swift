//
//  SettingsView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/7/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color.bg3.ignoresSafeArea()
            
            VStack {
                
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button{} label: {
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
