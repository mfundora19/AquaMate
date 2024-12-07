//
//  AquaBrainModel.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/5/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var user: User
    @Published var ouncesDrunk: Int = 0
    
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
