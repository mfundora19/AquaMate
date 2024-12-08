//
//  AquaMateApp.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/4/24.
//

import SwiftUI

@main
struct AquaMateApp: App {
    @Environment(\.scenePhase) private var scenePhase // Tracks Lifecycle
    @State var user: User? = UserDefaultsManager.shared.loadUser() // Initial user load
    
    var body: some Scene {
        WindowGroup {
            MainView(user: $user) // Pass binding to MainView
                .onChange(of: scenePhase) { _, newPhase in
                    if newPhase == .active {
                        NotificationManager.shared.clearBadgeCount()
                        user?.resetIfNewDay() // Reset if new Day
                    }
                }
        }
    }
}

