//
//  RegistrerViewModel.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/5/24.
//

import SwiftUI
import Foundation

class RegistererViewModel: ObservableObject {
    @Published var showTextField = false
    @Published var showWeightPicker = false
    @Published var showActivityRange = false
    @Published var showCustomGoal = false
    
    @Published var inputName = ""
    @Published var selectedWeight = 0.0
    @Published var minExercised: Double = 0
    @Published var waterGoal: Int = 64
    
    var user: User?
    
    
    // Check if the all requirement inputs are set
    var isFormComplete: Bool {
        !inputName.isEmpty && selectedWeight > 0
    }
    
    
    
    var getIdealWaterIntake: String {
        "\(waterGoal)oz"
    }
    
    // MARK: - Creating User
    func createUser() {
        user = User(name: inputName,
                    goalWaterIntake: waterGoal,
                    currentWaterIntake: 0,
                    weight: selectedWeight,
                    activityMinutes: Int(minExercised))
    }
    
    // MARK: - Buttons Actions
    func onNameButtonPressed() {
        withAnimation {
            showTextField = true
        }
    }
    func onWeightButtonPressed() {
        withAnimation {
            showWeightPicker = true
        }
    }
    func onActivityButtonPressed() {
        withAnimation {
            showActivityRange = true
        }
    }
}

enum ButtonIcons: String {
    case Name = "figure.wave"
    case Weight = "scalemass"
    case Fitness = "figure.run"
}
