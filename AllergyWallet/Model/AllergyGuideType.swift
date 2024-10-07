//
//  AllergyGuideType.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/7/24.
//

import Foundation

enum AllergyGuideType: Equatable {
    case checkMenu(User)
    case recommendMenu(User)
    case requestAllergenFree(User)
    case checkCrossContamination(User)
    case emergencySituation(User)
}


