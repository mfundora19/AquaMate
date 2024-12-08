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
    
    // Request the user access to send notification
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: options) { success, error in
                if let error = error {
                    print("Authorization failed: \(error.localizedDescription)")
                    completion(false)
                } else {
                    completion(success)
                }
            }
    }
    
    // Func that will allow me to set a notification every (x) time
    func scheduleNotification(in time: Double?) {
        // Remove any pending notification before adding the current
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        guard let time, time > 0 else {return}
        
        // Create the editable content for notifications
        let content = UNMutableNotificationContent()
        
        content.title = "Thirsty !?"
        content.subtitle = "Remember to hydrate"
        content.sound = .default
        content.badge = 1
        
        // Trigger (time)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
        
        
        // Schedule and request a notification
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        
        
        
        UNUserNotificationCenter.current().add(request) // Adding the current notification
        
    }
    
    // Function to clear the badge count
    func clearBadgeCount() {
        UNUserNotificationCenter.current().setBadgeCount(0)
    }
    
}
