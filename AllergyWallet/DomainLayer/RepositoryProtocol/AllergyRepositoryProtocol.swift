//
//  AllergyRepositoryProtocol.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 11/13/24.
//

import Foundation

protocol AllergyRepositoryProtocol {
    func fetchAllergies() async -> [AllergyCategory]
}
