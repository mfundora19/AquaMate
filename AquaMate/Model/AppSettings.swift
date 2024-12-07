//
//  AppSettings.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/7/24.
//

import Foundation

struct AppSettings {
    let notificationInHours: Double = 3600 * 3 // 3 hours default (in seconds)
    
    var notificationTime: Double // Notification interval in seconds
    var dailyWaterGoal: Double //
    
    init(notificationTime: Double? = nil, dailyWaterGoal: Double) {
        self.notificationTime = notificationTime ?? notificationInHours
        self.dailyWaterGoal = dailyWaterGoal
    }
    
    
}
