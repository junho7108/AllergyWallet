//
//  UserDefaults+Extensions.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/5/24.
//

import Foundation

extension UserDefaults {
    private enum Keys {
        static let user = "user"
    }
    
    func saveUsers(_ user: [User]) -> Bool {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            set(encoded, forKey: Keys.user)
            return true
        }
        
        return false
    }
    
    func loadUser() -> [User] {
        guard let data = data(forKey: Keys.user) else { return [] }
        
        let decoder = JSONDecoder()
        do {
            let users = try decoder.decode([User].self, from: data)
            return users
        } catch {
            print("Failed to decode user: \(error.localizedDescription)")
            return []
        }
    }
}
