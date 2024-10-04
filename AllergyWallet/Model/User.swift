//
//  User.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import Dependencies

struct User: Codable, Equatable {
    var name: String
    var allergries: Set<Allergy> = []
    var emergencyCard: EmergencyCard?
}
