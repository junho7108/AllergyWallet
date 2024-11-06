//
//  AuthRepository.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/5/24.
//

import Foundation

protocol AuthRepositoryType {
    func signUpUser(user: User) async -> Bool
    func fetchUser() async -> [User]
}

final class AuthRepository: AuthRepositoryType {
    func signUpUser(user: User) -> Bool {
        var users = fetchUser()
        
        guard users.count < 5 else { return false }
        
        users.append(user)
        
        return UserStorage.shared.saveUsers(users)
    }
    
    func fetchUser() -> [User] {
        return UserStorage.shared.loadUser()
    }
}

final class AuthRepositoryTest: AuthRepositoryType {
    func signUpUser(user: User) -> Bool {
        return true
    }
    
    func fetchUser() async -> [User] {
        return [
            User(
                name: "테스트",
                allergries: [
                    Allergy(korName: "아몬드", engName: "Almonds", emoji: "🌰"),
                    Allergy(korName: "브라질너트", engName: "Brazil Nuts", emoji: "🌰"),
                    Allergy(korName: "캐슈넛", engName: "Cashews", emoji: "🌰")
                ],
                emergencyCard: nil)
        ]
    }
}
