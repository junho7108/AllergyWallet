//
//  AuthRepositoryProtocol.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 11/13/24.
//

import Foundation

protocol AuthRepositoryProtocol {
    func signUpUser(user: User) async -> Bool
    func fetchUser() async -> [User]
}
