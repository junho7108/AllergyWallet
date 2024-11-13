//
//  Text+Extensions.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 11/8/24.
//

import SwiftUI

extension Text {
    func lineHeight(_ lineHeightPercentage: CGFloat, fontSize: CGFloat) -> some View {
        let lineSpacing = fontSize * ((lineHeightPercentage / 100) - 1)
        return self.lineSpacing(lineSpacing)
    }
}
