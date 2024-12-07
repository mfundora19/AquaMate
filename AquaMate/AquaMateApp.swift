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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onChange(of: scenePhase) { _, newPhase in
                    if newPhase == .active {
                        NotificationManager.shared.clearBadgeCount()
                    }
                }
        }
    }
}
