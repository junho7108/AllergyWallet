//
//  User.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import Foundation
import Dependencies

struct User: Codable, Equatable {
    var name: String
    var allergries: [Allergy] = []
    var emergencyCard: EmergencyCard?
    
    private(set) var uuid = UUID()
}

extension User: Identifiable {
    var id: UUID { return uuid }
}
