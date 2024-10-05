//
//  CheckMenuForAllergyCardView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/5/24.
//

import SwiftUI
import ComposableArchitecture

struct CheckMenuForAllergyCardView: View {
    
    let store: StoreOf<CheckMenuForAllergyFeature>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button { viewStore.send(.didTapBackButton) } label: {
                        HStack {
                            Spacer()
                            Image("Icon_reduce")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                    }
                    .frame(width: 40, height: 40)
                }
                .frame(height: 65)
                  
                
                Text("I have food allergies to the following ingredients:")
                    .font(.system(size: 28, weight: .semibold))
                
                AllergyGridView(store: store.scope(state: \.grid, action: \.never))
                    
                Text("Immediate medical attention is required if I consume or come into contact with any foods or sauces containing this ingredient.")
                    .font(.system(size: 14))
                    .foregroundColor(.gray700)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 8)
                
                Text("Allergic reactions may occur if food is prepared using gloves, utensils, or oil that has come into contact with this ingredient.")
                    .font(.system(size: 14))
                    .foregroundColor(.gray700)
                    .frame(maxWidth: .infinity)
                
                Spacer()
            }
            .padding(.horizontal, 24)
            .background(Color.primary50)
        }
        .statusBarHidden(true)
        .ignoresSafeArea(.all)
        .frame(maxWidth: .infinity)
    }
}
