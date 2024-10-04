//
//  SelectAllergyView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import SwiftUI
import ComposableArchitecture

struct SelectAllergyView: View {
    
    let store: StoreOf<SelectAllergyFeature>
    
    var body: some View {
        
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(alignment: .leading) {
            
                        Text("What Allergies Do You Have?")
                            .font(.system(size: 28, weight: .semibold))
                            .padding(.bottom, 12)
                        
                        Text("You can select up to 20 allergies")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.gray700)
                            .padding(.bottom, 48)
                        
                        Spacer()
                        
                        ForEach(Allergy.allCases) { allergy in
                            AllergyCheckBoxView(allegry: allergy, didSelect: { selectedInfo in
                                viewStore.send(.didSelectAllegry(selectedInfo))
                            })
                            .padding(.bottom, 8)
                        }
                    }
                }
                
                Spacer()
                
                Rectangle()
                    .frame(height: 0.8)
                    .foregroundColor(Color.gray200)
                
                Button(action: {
                    viewStore.send(.navigationToRegisterCard(viewStore.user))
                }) {
                    Text("Next")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 51)
                        .background(viewStore.isEnabledButton ? Color.primary500 : Color.gray200)
                        .cornerRadius(12)
                }
                .disabled(!viewStore.isEnabledButton)
            }
            .padding([.leading, .trailing], 24)
        }
    }
}

