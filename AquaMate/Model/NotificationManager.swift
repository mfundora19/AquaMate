//
//  NotificationManager.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/7/24.
//

import Foundation
import UserNotifications

class NotificationManager {
    
    static let shared = NotificationManager() // Singleton
    
    private init() {}
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: options) { (success, error) in
                // Check for the input
                guard success else {return}
                if let error {
                    print("\(error.localizedDescription)")
                }
                
                print(success)
                
            }
    }
    
    // Func that will allow me to set a notification every (x) time
    func scheduleNotification() {
        // Create the editable content for notifications
        let content = UNMutableNotificationContent()
        
        content.title = "This is my first notification!"
        content.subtitle = "This was sooooo easy!"
        content.sound = .default
        content.badge = 1
        
        // Triggers
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        
        // Schedule and request a notification
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    // Function to clear the badge count
    func clearBadgeCount() {
        UNUserNotificationCenter.current().setBadgeCount(0) { error in
            if let error = error {
                print("Failed to clear badge count: \(error)")
            } else {
                print("Badge count cleared successfully.")
            }
        }
    }
    
}
