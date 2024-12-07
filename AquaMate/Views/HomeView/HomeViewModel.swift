//
//  AquaBrainModel.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/5/24.
//

import SwiftUI
import Foundation

class HomeViewModel: ObservableObject {
    @Published var user: User
    @Published var showWaterInput = false
    @Published var showSettingsView = false
    @Published var ouncesDrunk: Double = 0 {
        didSet {
            // Directly update the user's water intake and trigger objectWillChange
            objectWillChange.send()
            
            user.currentWaterIntake += Int(ouncesDrunk * 16) // Multiply by 16 to convert to oz
            
            
            if userReachedGoal() { // Make the view change when goal achieved
                withAnimation {
                    user.dailyGoalCompleted = true
                }
            }
            
            
            // NOTE: Save the user's progress
            UserDefaultsManager.shared.saveUser(user)
        }
    }
    
    
    
    // Constructor
    init(user: User) {
        self.user = user
    }
    
    // Useful getters
    var getOunces: String {
        "\(user.currentWaterIntake)oz"
    }
    var getGoalPercentage: String {
        "Hydration • \(user.waterIntakeProgress)% of your goal"
    }
    
    // MARK: - Water Drop
    var progress: CGFloat {
        return CGFloat(user.waterIntakeProgress) / 100.0
    }
    
    // MARK: - Helper Functions
    func userReachedGoal() -> Bool { // Check if user accomplished his daily goal
        user.waterIntakeProgress >= 100
    }
}
