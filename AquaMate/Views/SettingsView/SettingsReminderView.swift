//
//  SettingsReminderView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/8/24.
//

import SwiftUI

struct SettingsReminderView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var user: User
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                CustomToggleView(title: "Reminders",
                                 isOn: $user.notificationOn,
                                 notify: $user.notifyAllowed)
                    .padding()
                
                if user.notificationOn {
                    SettingCustomStepper(value: $user.notifyEvery)
                        .padding()
                }
                
                
                Spacer()
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
        
        // Observe changes to save the User
        .onChange(of: user.notificationOn) {_, _ in
            manageNotification()
        }
        .onChange(of: user.notifyEvery) {_, _ in
            manageNotification()
        }
    }
    
    // Saves the user to UserDefaults & Schedule a notification
    private func manageNotification() {
        NotificationManager.shared.scheduleNotification(in: user.notifyEvery)
        UserDefaultsManager.shared.saveUser(user)
    }
}

#Preview {
    NavigationStack {
        SettingsReminderView(user: .constant(.init(name: "John", goalWaterIntake: 0, notifyAllowed: true)))
    }
}
