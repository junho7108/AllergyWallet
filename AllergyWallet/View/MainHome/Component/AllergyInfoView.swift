//
//  AllergyInfoView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/4/24.
//

import SwiftUI
import ComposableArchitecture

struct AllergyInfoState: Equatable {
    var user: User
}

struct AllergyInfoView: View {
    
    @Binding var allergies: [Allergy]
    
    var didTapButton: (([Allergy]) -> Void)? = nil
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(hex: "#DFF3EC"))
            
            Image("Character")
                .resizable()
                .scaledToFit()
                .frame(width: 194)
                .padding(.trailing, 12)
            
            VStack(alignment: .leading, spacing: 0) {
                
                HStack {
                    Text("My Allegry Info")
                        .font(.system(size: 16))
                    
                    Spacer()
                    
                    Button {
                        didTapButton?(allergies)
                    } label: {
                        HStack {
                            Spacer()
                            Image("Icon_arrow")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                    }
                    .frame(width: 24, height: 24)
                }
                .frame(height: 24)
                .padding(.bottom, 24)
                
                ChipLayout(verticalSpacing: 8, horizontalSpacing: 8) {
                    ForEach(Array(allergies.enumerated()), id: \.element.id) { index, allergy in
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 36)
                                .fill(.white)
                            
                            Text("\(allergy.emoji) \(allergy.engName)")
                                .padding(.horizontal, 12)
                        }
                        .frame(height: 32)
                        .fixedSize()
                    }
                }
                
                Spacer()
            }
            .padding(16)
        }
//        .frame(maxWidth: .infinity, maxHeight: 248)
        .shadow(color: .black.opacity(0.1), radius: 5)
    }
}
