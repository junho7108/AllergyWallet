//
//  AllergyListView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/7/24.
//

import SwiftUI

struct AllergyListView: View {
    
    @Binding var language: LanguageType
    @Binding var allergies: [Allergy]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            Text(language == .eng ? "Allergy Information" : "알레르기 정보")
                .font(.system(size: 16))
                .foregroundColor(.gray900)
            
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.white)
 
                ChipLayout(verticalSpacing: 4, horizontalSpacing: 4) {
                    
                    ForEach(Array(allergies.enumerated()), id: \.1.id) { index, allergy in
                        HStack(spacing: 4) {
                            Text(language == .eng ? allergy.engName : allergy.korName)
                                .font(.system(size: 18))
                                .foregroundColor(.gray900)
                                .fixedSize()
                            
                            if index < allergies.count - 1 {
                                Text("/")
                                    .font(.system(size: 18))
                                    .foregroundColor(.gray500)
                            }
                        }
                    }
                }
                .padding(16)
            }
            .defaultShadow()
        }
        .frame(maxWidth: .infinity)
    }
}


