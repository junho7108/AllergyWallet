//
//  RegisterSelectAllergyView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import SwiftUI
import ComposableArchitecture

struct RegisterSelectAllergyView: View {
    
    let store: StoreOf<RegisterSelectAllergyFeature>
    
    var body: some View {
        
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 48) {
                        
                        Text("What Allergies Do You Have?")
                            .font(.system(size: 28, weight: .semibold))
                        
                        LazyVStack(alignment: .leading, spacing: 8) {
                            ForEach(viewStore.allergyCategories) { category in
                                if category.allergies.count == 1 {
                                    let allergy = category.allergies[0]
                                    
                                    var isSelected: Bool = viewStore.selectedAllergies.contains(where: { $0.engName == allergy.engName })
                                    
                                    AllergyCheckBoxView(allegry: allergy,
                                                        isSelected: Binding<Bool>(get: { isSelected },
                                                                                  set: { isSelected = $0 })) { selectedInfo in
                                        viewStore.send(.didSelectAllegry(selectedInfo))
                                    }
                                } else {
                                    AllergyPickerView(category: "\(category.emoji) \(category.engName)",
                                                      allergies: category.allergies) { selectedInfo in
                                        viewStore.send(.didSelectAllegry(selectedInfo))
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                }
                
                Spacer()
                
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
                .padding(.horizontal, 24)
                .disabled(!viewStore.isEnabledButton)
            }
            .padding(.vertical, 24)
            .onAppear {
                viewStore.send(.fetchData)
            }
        }
    }
}

