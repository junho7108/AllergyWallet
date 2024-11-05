//
//  Allergy.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import Foundation

protocol LocalizedRepresentable {
    var korName: String { get set }
    var engName: String { get set }
    var emoji: String { get set }
}

struct AllergyCategory: Codable, Equatable, LocalizedRepresentable {
    var korName: String
    var engName: String
    var emoji: String
    
    var allergies: [Allergy]
}

extension AllergyCategory: Identifiable {
    var id: String { return engName }
}

struct Allergy: Codable, Equatable, LocalizedRepresentable {
    var korName: String
    var engName: String
    var emoji: String
}

extension Allergy: Identifiable {
    var id: String { return engName }
    
    var name: String {
        switch Const.language {
        case .eng: engName
        case .kor: korName
        }
    }
}

