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
    
    //Notifications
    var notificationOn: Bool = true { // Notifications on by default
        didSet {
            if !notificationOn { // If notifications are off clear them all
                clearNotifications()
            }
        }
    }
    var lastTimeLogged: Date = Date()
    var notifyEvery: Double =  3 * 3600 // 3h by default (in seconds)
    
    // Get the % of water accomplished based on goal
    var waterIntakeProgress: Int {
        Int((Double(currentWaterIntake) / Double(goalWaterIntake)) * 100.0)
    }
    
    // Remove any notifications remaining
    private func clearNotifications() {
        NotificationManager.shared.scheduleNotification(in: nil)
    }
    
    // Reset Stats on NewDay
    mutating func resetIfNewDay() {
        let calendar = Calendar.current
        let now = Date()
        
        // Check if the last logged date is a different day
        if !calendar.isDate(lastTimeLogged, inSameDayAs: now) {
            currentWaterIntake = 0
            dailyGoalCompleted = false
            lastTimeLogged = now
        }
    }

}
