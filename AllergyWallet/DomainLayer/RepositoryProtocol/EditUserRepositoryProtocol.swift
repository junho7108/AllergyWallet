//
//  EditUserRepositoryProtocol.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 11/13/24.
//

import Foundation

protocol EditUserRepositoryProtocol {
    func replaceUser(user: User) -> [User]
    func deleteUser(user: User) -> [User]
}

