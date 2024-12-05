//
//  AquaBrainModel.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/5/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    // MARK: - User
    @Published var user: User?
    
    
    // MARK: - Ounces of Water
    @Published var ouncesDrunk: Int = 0
    
    var getOunces: String {
        "\(user?.currentWaterIntake ?? 0)oz"
    }
    var getGoalPercentage: String {
        "Hydration • \(user?.waterIntakeProgress ?? 0)% of your goal"
    }
    
    // MARK: - Water Drop
    @Published var progress: CGFloat = 0.5
    @Published var startAnimation: CGFloat = 0
    
}
