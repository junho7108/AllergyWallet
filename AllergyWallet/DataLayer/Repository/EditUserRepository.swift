//
//  EditUserRepository.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/16/24.
//

import Foundation

final class EditUserRepository: EditUserRepositoryProtocol {
    func replaceUser(user: User) -> [User] {
        return UserStorage.shared.replaceUser(user: user)
    }
    
    func deleteUser(user: User) -> [User] {
        return UserStorage.shared.deleteUser(user: user)
    }
}
