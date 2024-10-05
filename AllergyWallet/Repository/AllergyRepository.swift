//
//  AllergyRepository.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/4/24.
//

import Foundation

protocol AllergyRepositoryType {
    func fetchAllergies() async -> [AllergyType]
}

final class AllergyRepositoryTest: AllergyRepositoryType {
    func fetchAllergies() async -> [AllergyType] {
        return await [
            AllergyType(category: "Milk", allergies: [
                Allergy(korName: "우유", engName: "Milk", emoji: "🥛")
            ]),
            
            AllergyType(category: "Egg", allergies: [
                Allergy(korName: "달걀", engName: "egg", emoji: "🥚")
            ]),
            
            AllergyType(category: "TreeNut", allergies: [
                Allergy(korName: "아몬드", engName: "Almonds", emoji: "🌰"),
                Allergy(korName: "브라질너트", engName: "Brazil Nuts", emoji: "🌰"),
                Allergy(korName: "캐슈넛", engName: "Cashews", emoji: "🌰")
            ])
        ]
    }
}
