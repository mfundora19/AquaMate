//
//  AquaBrainModel.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/5/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var user: User
    @Published var ouncesDrunk: Double = 0 {
        didSet {
            // Directly update the user's water intake and trigger objectWillChange
            objectWillChange.send()
            user.currentWaterIntake += Int(ouncesDrunk * 16) // Multiply by 16 to convert to oz
        }
    }
    @Published var showWaterInput = false
    
    init(user: User) {
        self.user = user
    }
    
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
}
