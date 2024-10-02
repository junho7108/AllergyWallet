//
//  Allergy.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import Foundation

enum Allergy: String, CaseIterable {
    case milk, egg, soy, peanut, treeNut, wheat, seed, grain, gluten
}

extension Allergy: Codable, Equatable, Identifiable {
    var id: String { rawValue }
}

extension Allergy {
    var text: String {
        switch self {
        case .milk: return "🥛 Milk"
        case .egg: return "🥚 Egg"
        case .soy: return "🫛 Soy"
        case .peanut: return "🥜 Peanut"
        case .treeNut: return "🌰 Tree Nut"
        case .wheat: return "🌾 Wheat"
        case .seed: return "🌱 Seed"
        case .grain: return "🌾 Grain"
        case .gluten: return "🍞 Gluten"
        }
    }
}
