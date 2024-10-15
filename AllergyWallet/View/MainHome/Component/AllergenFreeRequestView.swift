//
//  AllergenFreeRequestView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/5/24.
//

import SwiftUI
import ComposableArchitecture

struct AllergenFreeRequestView: View {
    
    var didTapButton: (() -> Void)
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.primary50)
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Allergen-Free Request")
                        .font(.system(size: 16))
                    
                    Spacer()
                    
                    Button { didTapButton() } label: {
                        
                        HStack {
                            Spacer()
                            Image("Icon_arrow")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                        
                    }
                    .frame(width: 40, height: 40)
                    
                }
                .padding(16)
                
                Spacer()
            }
        }
        .shadow(color: .black.opacity(0.1), radius: 5)
        .frame(height: 116)
    }
}

