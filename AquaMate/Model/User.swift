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
    var currentWaterIntake: Int
    var weight: Double // Lb
    var minOfExercises: Int // Minutes
    
    // The Ideal amount a person should drink based on its situation
    var idealWaterIntake: Int {
        // Base water intake calculation (2/3 of body weight in ounces)
        let baseIntake = Int(weight * 2 / 3)
        
        // Additional water intake for exercise (12 ounces per 30 minutes of exercise)
        let additionalIntake = (minOfExercises / 30) * 12
        
        // Total water intake
        return Int(baseIntake + additionalIntake)
    }
    
    // Get the % of water accomplished based on goal
    var waterIntakeProgress: Int {
        Int((Double(currentWaterIntake) / Double(goalWaterIntake)) * 100.0)
    }
}
