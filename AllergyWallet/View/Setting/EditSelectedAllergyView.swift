//
//  EditAllergySelectionView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/25/24.
//

import SwiftUI
import ComposableArchitecture

struct EditSelectedAllergyView: View {
    
    let store: StoreOf<EditSelectedAllergyFeature>
    
    var body: some View {
        
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 48) {
            
                        Text("What Allergies Do You Have?")
                            .font(.system(size: 28, weight: .semibold))
                            .padding(.bottom, 12)
    
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
                                    let isExpanded: Bool = category.allergies.contains(where: { viewStore.selectedAllergies.contains($0)})
                                    
                                    AllergyPickerView(isExpanded: isExpanded,
                                                      selectedAllergy: viewStore.selectedAllergies,
                                                      category: "\(category.emoji) \(category.engName)",
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
                
                HStack(spacing: 12) {
                    Button(action: {
                        viewStore.send(.didTapBackButton)
                    }) {
                        Text("Cancel")
                            .font(.system(size: 16))
                            .foregroundColor(.primary500)
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 51)
                            .background(Color.white)
                            .cornerRadius(12)
                    } 
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.primary500, lineWidth: 0.8)
                    )
                    
                    Button(action: {
                        viewStore.send(.editSelectedAllergy(viewStore.selectedAllergies))
                    }) {
                        Text("Save")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 51)
                            .background(Color.primary500)
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal, 24)
            }
            .padding(.vertical, 24)
            .onAppear {
                viewStore.send(.fetchData)
            }
        }
        .navigationTitle("Edit Allergy Selection")
    }
}

