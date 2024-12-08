//
//  User.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/4/24.
//

import Foundation

struct User: Codable {
    let name: String
    var goalWaterIntake: Int // The goal
    var dailyGoalCompleted: Bool = false
    var currentWaterIntake: Int = 0
    var lastResetDate: Date? = nil 
    
    //Notifications
    var notificationOn: Bool = false {
        didSet {
            if !notificationOn { // If notifications are set to off, clear them all
                clearNotifications()
            }
        }
    }
    var notifyAllowed: Bool
    var notifyEvery: Double =  3 * 3600 // 3h by default (in seconds)
    
    // Get the % of water accomplished based on goal
    var waterIntakeProgress: Int {
        if goalWaterIntake > 0 {
            return Int((Double(currentWaterIntake) / Double(goalWaterIntake)) * 100.0)
        } else {
            return 0 // Safely return 0 progress if the goal is 0
        }
    }
    
    // Remove any notifications remaining
    private func clearNotifications() {
        NotificationManager.shared.scheduleNotification(in: nil)
    }
    



}
