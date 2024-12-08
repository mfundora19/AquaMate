//
//  CustomToggleView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/8/24.
//

import SwiftUI

struct CustomToggleView: View {
    let title: String
    @Binding var isOn: Bool
    @Binding var notify: Bool
    @State private var showAlert = false
    @State private var preIsOn: Bool
    
    init(title: String, isOn: Binding<Bool>, notify: Binding<Bool>) {
        self.title = title
        self._isOn = isOn
        self._notify = notify
        // Initialize preIsOn based on isOn binding
        _preIsOn = State(initialValue: isOn.wrappedValue)
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
            Spacer()
            
            HStack {
                Text(isOn ? "On" : "Off")
                    .foregroundStyle(.base)
                Toggle("", isOn: $preIsOn)
                    .toggleStyle(SwitchToggleStyle(tint: .base))
                    .labelsHidden()
                    .onChange(of: preIsOn) { _, _ in
                        if notify {
                            isOn = preIsOn
                        } else {
                            // Ensure toggle is off if notifications aren't enabled
                            preIsOn = false
                            showAlert = true
                        }
                    }
            }
            
        }.padding()
            .frame(height: 100)
            .background(.secondary)
            .clipShape(.rect(cornerRadius: 30))
            .onAppear {
                // Check notification authorization when the view appears
                NotificationManager.shared.checkAuthorizationStatus { isAuthorized in
                    if isAuthorized {
                        notify = true
                        isOn = preIsOn
                    } else {
                        notify = false
                        preIsOn = false // Turn off toggle if notifications aren't authorized
                    }
                }
            }
            .onChange(of: notify) { _, _ in
                // Recheck notification status when `notify` changes
                NotificationManager.shared.checkAuthorizationStatus { isAuthorized in
                    if isAuthorized {
                        notify = true
                        isOn = preIsOn
                    } else {
                        notify = false
                        preIsOn = false // Keep toggle off if notifications aren't authorized
                    }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Enable Notifications"),
                    message: Text("Please enable notifications in Settings to receive updates."),
                    primaryButton: .default(Text("Go to Settings")) {
                        // Open settings to enable notifications
                        if let url = URL(string: UIApplication.openSettingsURLString),
                           UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    },
                    secondaryButton: .cancel {
                        // Reset the toggle to off if notifications are not enabled
                        isOn = false
                        preIsOn = false
                    }
                )
            }
    }
}

#Preview {
    CustomToggleView(title: "Reminders", isOn: .constant(false), notify: .constant(false))
}

