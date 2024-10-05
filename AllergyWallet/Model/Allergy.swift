//
//  Allergy.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import Foundation

struct AllergyType: Codable, Equatable {
    var category: String
    var allergies: [Allergy]
}

extension AllergyType: Identifiable {
    var id: String { return category }
}

struct Allergy: Codable, Equatable {
    var korName: String
    var engName: String
    var emoji: String
}

extension Allergy: Identifiable {
    var id: String { return engName }
}
