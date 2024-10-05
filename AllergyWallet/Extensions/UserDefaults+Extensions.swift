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
    
    func saveUser(_ user: User) -> Bool {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            set(encoded, forKey: Keys.user)
            return true
        }
        
        return false
    }
    
    func loadUser() -> User? {
        let decoder = JSONDecoder()
        if let data = data(forKey: Keys.user) {
            return try? decoder.decode(User.self, from: data)
        }
        return nil
    }
}
