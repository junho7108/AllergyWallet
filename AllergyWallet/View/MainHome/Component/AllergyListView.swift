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
                
             
                Grid(alignment: .leading, horizontalSpacing: 8, verticalSpacing: 4, content: {
                    GridRow {
                        ForEach(allergies) { allergy in
                            Text(allergy.engName)
                                .font(.system(size: 18))
                                .foregroundColor(.gray900)
                            
                        }
                        .padding(16)
                    }
                })
            }
            .frame(minHeight: 62)
            .defaultShadow()
        }
        .frame(maxWidth: .infinity)
    }
}


