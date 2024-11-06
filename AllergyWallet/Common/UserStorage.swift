//
//  UserStorage.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/16/24.
//

import Foundation

final class UserStorage {
    
    static let shared = UserStorage()
    
    private let storage = UserDefaults.standard
    
    private init() { }
    
    private enum Keys {
        static let user = "user"
    }
    
    func saveUsers(_ user: [User]) -> Bool {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            storage.set(encoded, forKey: Keys.user)
            return true
        }
        
        return false
    }
    
    func loadUser() -> [User] {
        guard let data = storage.data(forKey: Keys.user) else { return [] }
        
        let decoder = JSONDecoder()
        do {
            let users = try decoder.decode([User].self, from: data)
            return users
        } catch {
            print("Failed to decode user: \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteUser(user: User) -> [User] {
        var users = loadUser()
        
        if let index = users.firstIndex(where: { $0.id == user.id }) {
            users.remove(at: index)
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(users) {
                storage.set(encoded, forKey: Keys.user)
            }
        }
        
        return users
    }
    
    func replaceUser(user: User) -> [User] {
        var users = loadUser()
        
        if let index = users.firstIndex(where: { $0.id == user.id }) {
            users[index] = user
            
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(users) {
                storage.set(encoded, forKey: Keys.user)
            }
        }
        
        return users
    }
}
