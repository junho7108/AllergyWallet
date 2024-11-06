//
//  EditUserProfileRepository.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/16/24.
//

import Foundation

protocol EditUserProfileRepositoryType {
    func replaceUser(user: User) -> [User]
    func deleteUser(user: User) -> [User]
}

final class EditUserProfileRepository: EditUserProfileRepositoryType {
    func replaceUser(user: User) -> [User] {
        return UserStorage.shared.replaceUser(user: user)
    }
    
    func deleteUser(user: User) -> [User] {
        return UserStorage.shared.deleteUser(user: user)
    }
}
