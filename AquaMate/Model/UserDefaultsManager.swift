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
    private let appSettingsKey = "app_settings_key"
    
    // MARK: - Save the USER
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
    
    // MARK: - Save the APP Settings
    func saveAppSettings(_ app: AppSettings) {
        let encoder = JSONEncoder()
        
        if let encodedData = try? encoder.encode(app) {
            UserDefaults.standard.set(encodedData, forKey: appSettingsKey)
        }
    }
    
    func loadAppSettings() -> AppSettings? {
        if let savedData = UserDefaults.standard.data(forKey: appSettingsKey) {
            let decoder = JSONDecoder()
            
            if let loadedAppSettings = try? decoder.decode(AppSettings.self, from: savedData) {
                return loadedAppSettings
            }
        }
        return nil
    }
}
