//
//  RegistrerViewModel.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/5/24.
//

import SwiftUI
import Foundation

class RegisterViewModel: ObservableObject {
    // Show the RegisterInputViews
    @Published var showTextField = false
    @Published var showWeightPicker = false
    @Published var showActivityRange = false
    @Published var showCustomGoal = false
    
    @Published var inputName = ""
    @Published var waterGoal: Int = 64
    @Published var selectedWeight = 0.0 {
        didSet {
            isWeightSet = true
            updateWaterGoalIfNeeded()
        }
    }
    @Published var minExercised: Double = 0 {
        didSet {
            updateWaterGoalIfNeeded()
        }
    }
    
    private var isWeightSet = false
    var user: User?
    
    // Check if the all requirement inputs are set
    var isFormComplete: Bool {
        !inputName.isEmpty && selectedWeight > 0
    }
    
    // The Ideal amount a person should drink based on its situation
    var idealWaterIntake: Int {
        // Base water intake calculation (2/3 of body weight in ounces)
        let baseIntake = Int(selectedWeight * 2 / 3)
        
        // Additional water intake for exercise (12 ounces per 30 minutes of exercise)
        let additionalIntake = Int(minExercised / 30) * 12
        
        // Total water intake
        return Int(baseIntake + additionalIntake)
    }
    
    // Display the ideal Water Intake
    var getIdealWaterIntake: String {
        return "\(waterGoal)oz"
    }
    
    // MARK: - Creating User
    func createUser() -> (User) {
        var authorization: Bool = false
        
        NotificationManager.shared.requestAuthorization { auth in
            authorization = auth
        }
        return User(name: inputName,
                    goalWaterIntake: waterGoal,
                    currentWaterIntake: 0,
                    notifyAllowed: authorization)

    }
    
    
    // MARK: - Update Water Goal
    private func updateWaterGoalIfNeeded() {
        // Update water goal only if the weight has been set
        guard isWeightSet else { return }
        
        waterGoal = idealWaterIntake
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

