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
                    
                    VStack(alignment: .leading) {
            
                        Text("What Allergies Do You Have?")
                            .font(.system(size: 28, weight: .semibold))
                            .padding(.bottom, 12)
                        
                        Text("You can select up to 20 allergies")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.gray700)
                            .padding(.bottom, 48)
                        
                        Spacer()
                        
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
            .padding(24)
            .onAppear {
                viewStore.send(.fetchData)
            }
        }
    }
}

