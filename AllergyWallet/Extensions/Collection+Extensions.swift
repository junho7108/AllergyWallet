//
//  Collection+Extensions.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 11/1/24.
//

import Foundation

extension Collection {
    
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
