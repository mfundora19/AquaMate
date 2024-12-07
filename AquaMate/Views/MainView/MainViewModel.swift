//
//  MainViewModel.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/7/24.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var greetUser = true
    @Published var user: User? = nil
    @Published var appSettings: AppSettings? = nil
    @Published var navigationToHome = false
    
    
    
    // MARK: - Helper Functions
    
    // Load the app's data from User Defaults
    func preparations() {
        user = UserDefaultsManager.shared.loadUser()
        appSettings = UserDefaultsManager.shared.loadAppSettings()
    }
    
    
    func handleDataCreation(newUser: User, newAppSettings: AppSettings) {
        user = newUser
        appSettings = newAppSettings
        UserDefaultsManager.shared.saveUser(newUser)
        UserDefaultsManager.shared.saveAppSettings(newAppSettings)
        navigationToHome = true
    }
    
    // Don't go Home until we got an user
    func handleGreetingCompletion() {
        navigationToHome = (user != nil)
    }
}

