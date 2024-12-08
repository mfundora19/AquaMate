//
//  AquaBrainModel.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/5/24.
//

import SwiftUI
import Foundation

class HomeViewModel: ObservableObject {
    @Published var user: User {
        didSet {
            checkDailyGoalAchieved()
        }
    }
    @Published var showWaterInput = false
    @Published var showSettingsView = false
    @Published var dailyGoalReached: Bool = false {
        didSet {
            UserDefaultsManager.shared.saveUser(user)
        }
    }
    @Published var notificationAcceptance: Bool
    @Published var ouncesDrunk: Double = 0 {
        didSet {
            // Directly update the user's water intake and trigger objectWillChange
            objectWillChange.send()
            
            user.currentWaterIntake += Int(ouncesDrunk) 
            
            // Make the view change when goal achieved
            withAnimation {
                user.dailyGoalCompleted = userReachedGoal
            }
        
            
            // Set notification
            if checkNotificationAllowance {
                NotificationManager.shared.scheduleNotification(in: user.notifyEvery)
            }
            
            
            // NOTE: Save the user's progress
            UserDefaultsManager.shared.saveUser(user)
        }
    }
    
    
    
    // Constructor
    init(user: User, notify notificationAcceptance: Bool) {
        self.user = user
        self.notificationAcceptance = notificationAcceptance
        self.dailyGoalReached = self.user.dailyGoalCompleted
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
    
    // MARK: - Helper Computed Properties
    private var userReachedGoal: Bool { // Check if user accomplished his daily goal
        user.waterIntakeProgress >= 100
    }
    private var checkNotificationAllowance: Bool {
        // Check that user has its notifications on and it hasn't reached its daily goal
        return !user.dailyGoalCompleted && user.notificationOn
    }
    // Check if user set new Goal and update UI
    private func checkDailyGoalAchieved() {
        withAnimation {
            dailyGoalReached = Int(user.currentWaterIntake) >= user.goalWaterIntake
        }
    }
}
