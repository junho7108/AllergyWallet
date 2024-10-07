//
//  AuthRepository.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/5/24.
//

import Foundation

protocol AuthRepositoryType {
    func signUpUser(user: User) async -> Bool
    func fetchUser() async -> User?
}

final class AuthRepository: AuthRepositoryType {
    func signUpUser(user: User) async -> Bool {
        return UserDefaults.standard.saveUser(user)
    }
    
    func fetchUser() async -> User? {
        let user = await UserDefaults.standard.loadUser()
        print("🟢 user \(user)")
        return user
    }
}

final class AuthRepositoryTest: AuthRepositoryType {
    func signUpUser(user: User) -> Bool {
        return true
    }
    
    func fetchUser() async -> User? {
        return User(
            name: "테스트",
            allergries: [
                Allergy(korName: "아몬드", engName: "Almonds", emoji: "🌰"),
                Allergy(korName: "브라질너트", engName: "Brazil Nuts", emoji: "🌰"),
                Allergy(korName: "캐슈넛", engName: "Cashews", emoji: "🌰")
            ],
            emergencyCard: nil)
    }
}
