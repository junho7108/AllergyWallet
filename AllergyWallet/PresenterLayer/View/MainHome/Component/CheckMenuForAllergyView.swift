//
//  CheckMenuForAllergyView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/5/24.
//

import SwiftUI
import ComposableArchitecture

struct CheckMenuForAllergyView: View {
    
    var didTapButton: (() -> Void)? = nil
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.primary50)
            
            VStack(alignment: .leading, spacing: 0) {
                
                HStack {
                    Text("Check Menu For Allergens")
                        .font(.system(size: 16))
                      
                    Spacer()
                    
                    Button {
                        didTapButton?()
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
                
                Spacer()
            }
            .padding(16)
            
        }
        .onTapGesture {
            didTapButton?()
        }
        .shadow(color: .black.opacity(0.1), radius: 5)
        .frame(height: 116)
    }
}