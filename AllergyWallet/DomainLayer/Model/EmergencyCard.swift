//
//  EmergencyCard.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/3/24.
//

import Foundation

struct EmergencyCard: Codable, Equatable {
    var firstName: String?
    var lastName: String?
    var birthDate: String?
    var nationality: String?
    var emergencyContact: String?
    var koreanContact: String?
}
