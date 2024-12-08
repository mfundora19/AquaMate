//
//  LocalNotificationManager.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/8/24.
//

import Foundation
import NotificationCenter

@MainActor
class LocalNotificationManager: ObservableObject {
    let notificationCenter = UNUserNotificationCenter.current()
    
    @Published var isGranted = false
    
    func requestAuthorization() async throws {
        try await notificationCenter.requestAuthorization(options: [.alert, .sound, .badge])
        
        await getCurrentSettings()
    }
    
    func getCurrentSettings() async {
        let currentSettings = await notificationCenter.notificationSettings()
        isGranted = currentSettings.authorizationStatus == .authorized
        print(isGranted)
    }
    
    func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                Task {
                    await UIApplication.shared.open(url)
                }
            }
        }
    }
}
