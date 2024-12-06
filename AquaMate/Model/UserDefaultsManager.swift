//
//  UserDefaultsManager.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/6/24.
//

import Foundation

class UserDefaultsManager {
    // Singleton instance
    static let shared = UserDefaultsManager()
    
    private let userKey = "user_key"
    
    // Private initializer to prevent instantiation from outside
    private init() {}
    
    // Save User to UserDefaults
    func saveUser(_ user: User) {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(user) {
            UserDefaults.standard.set(encodedData, forKey: userKey)
        }
    }
    
    // Load User from UserDefaults
    func loadUser() -> User? {
        if let savedData = UserDefaults.standard.data(forKey: userKey) {
            let decoder = JSONDecoder()
            
            if let loadedUser = try? decoder.decode(User.self, from: savedData) {
                return loadedUser
            }
        }
        
        return nil
    }
}
