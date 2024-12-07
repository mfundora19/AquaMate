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
    var lastTimeLogged: Date = Date()
    var notifyEvery: Double = 3600 * 3 // 3h by default (in seconds)
    
    // Get the % of water accomplished based on goal
    var waterIntakeProgress: Int {
        Int((Double(currentWaterIntake) / Double(goalWaterIntake)) * 100.0)
    }
}
