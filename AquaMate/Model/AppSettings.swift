//
//  AppSettings.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/7/24.
//

import Foundation

struct AppSettings: Codable {
    var notificationInHours: Double = 3600 * 3 // 3 hours default (in seconds)
    var defaultWaterGoal = 64 // oz
    
    var notificationTime: Double // Notification interval in seconds
    var dailyWaterGoal: Int 
    
    init(notificationTime: Double? = nil, dailyWaterGoal: Int? = nil) {
        self.notificationTime = notificationTime ?? notificationInHours
        self.dailyWaterGoal = dailyWaterGoal ?? defaultWaterGoal
    }
    
}
