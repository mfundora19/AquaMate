//
//  AquaMateApp.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/4/24.
//

import SwiftUI

@main
struct AquaMateApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @State var user: User? = UserDefaultsManager.shared.loadUser()
    
    var body: some Scene {
        WindowGroup {
            MainView(user: $user)
                .onChange(of: scenePhase) { _, newPhase in
                    if newPhase == .active {
                        // Check if notification authorization status has changed when the app becomes active
                        NotificationManager.shared.checkAuthorizationStatus { auth in
                            // Update the user object with the new notification status
                            if var user = user {
                                user.notifyAllowed = auth
                                self.user = user
                                UserDefaultsManager.shared.saveUser(user)
                            }
                        }
                        
                        // Reset the badge count when the app becomes active
                        NotificationManager.shared.clearBadgeCount()
                        
                        // Reset user stats if a new day has begun
                        user?.resetIfNewDay()
                    }
                }
        }
    }
}


