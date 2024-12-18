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
    @Published var navigationToHome = false
    @Published var notificationAcceptance = false
    
    
    
    // MARK: - Helper Functions
    
    init(user: User?) {
        self.user = user
    }
    
    // Load the app's data from User Defaults
    func preparations() {
        user = UserDefaultsManager.shared.loadUser()
    }
    
    
    func handleUserCreation(newUser: User) {
        user = newUser
        user?.notificationOn = notificationAcceptance // If user did't accept set it to off
        UserDefaultsManager.shared.saveUser(newUser)
        navigationToHome = true
    }
    
    // Don't go Home until we got an user
    func handleGreetingCompletion() {
        navigationToHome = (user != nil)
    }
}

