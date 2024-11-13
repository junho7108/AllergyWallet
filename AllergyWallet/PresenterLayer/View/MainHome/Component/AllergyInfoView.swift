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
    
    private(set) var maxCount = 4
    
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
                        .font(.system(size: 16, weight: .medium))
                    
                    Spacer()
                    
                    Button {
                        didTapButton?(allergies)
                    } label: {
                        HStack {
                            Spacer()
                            Image("Icon_arrow")
                                .resizable()
                                .scaledToFill()
                        }
                    }
                    .frame(width: 24, height: 24)
                }
                .frame(height: 24)
                .padding(.bottom, 24)
                
                ChipLayout(verticalSpacing: 8, horizontalSpacing: 8) {
                    
                    let showMoreIndicator = allergies.count > maxCount
                    
                    ForEach(allergies.prefix(maxCount)) { allergy in
                        chipView(title: "\(allergy.emoji) \(allergy.engName)")
                    }
                    
                    if showMoreIndicator {
                        chipView(title: "‧‧‧ and more")
                    }
                }
                
                Spacer()
            }
            .padding(16)
        }
        .onTapGesture {
            didTapButton?(allergies)
        }
        .frame(maxWidth: .infinity, maxHeight: 248)
        .shadow(color: .black.opacity(0.1), radius: 5)
    }
}

private extension AllergyInfoView {
    func chipView(title: String) -> some View{
        ZStack {
            RoundedRectangle(cornerRadius: 36)
                .fill(.white)
            
            Text(title)
                .padding(.horizontal, 12)
        }
        .frame(height: 32)
        .fixedSize()
    }
}
