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
    
    @Published var inputName = ""
    @Published var selectedWeight = 0
    @Published var minExercised: Double = 0.0
    
    var name = ""
    var weight: Double = 0.0
    var minOfExercises: Int = 0
    var goalWaterIntake: Int = 0
    var idealWaterIntake: Int = 64 // Default
    
    var getIdealWaterIntake: String {
        "\(idealWaterIntake)oz"
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
