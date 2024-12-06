//
//  User.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/4/24.
//

import Foundation

struct User {
    let name: String
    var goalWaterIntake: Int // The goal
    var currentWaterIntake: Int = 0
    var weight: Double // Lb
    var activityMinutes: Int = 0 // Minutes
    
    // Get the % of water accomplished based on goal
    var waterIntakeProgress: Int {
        Int((Double(currentWaterIntake) / Double(goalWaterIntake)) * 100.0)
    }
}
