//
//  User.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/4/24.
//

import Foundation

struct User {
    let name: String
    
    var weight: Double // Lb
    var minOfExercises: Double // Min
    var goalWaterIntake: Int // Oz
    
    // The Ideal amount a person should drink based on its situation
    var idealWaterIntake: Int {
        // Base water intake calculation (2/3 of body weight in ounces)
        let baseIntake = weight * 2 / 3
        
        // Additional water intake for exercise (12 ounces per 30 minutes of exercise)
        let additionalIntake = (minOfExercises / 30) * 12
        
        // Total water intake
        return Int(baseIntake + additionalIntake)
    }
}
