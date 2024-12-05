//
//  RegistrerViewModel.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/5/24.
//

import Foundation

class RegistererViewModel: ObservableObject {
    @Published var showTextField = false
    @Published var inputName = ""
    
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
        showTextField = true
    }
}

enum ButtonIcons: String {
    case Name = "figure.wave"
    case Weight = "scalemass"
    case Fitness = "figure.run"
}
