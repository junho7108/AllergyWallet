//
//  AllergyGridView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/6/24.
//

import SwiftUI
import ComposableArchitecture

struct AllergyGridState: Equatable {
    var allergies: [Allergy]
}

struct AllergyGridView: View {
    
    let store: Store<AllergyGridState, Never>
    
    @Binding var language: LanguageType
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            if viewStore.allergies.count == 1 {
                let columns = [GridItem(.flexible())]
                
                LazyVGrid(columns: columns, spacing: 16) {
                    
                    ForEach(viewStore.allergies) { allergy in
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 24)
                                .fill(.white)
                            
                            VStack(spacing: 8) {
                                Text(allergy.emoji)
                                    .font(.system(size: 120, weight: .semibold))
                                
                                let allergyName = language == .eng ? allergy.engName : allergy.korName
                                
                                Text(allergyName)
                                    .font(.system(size: 24, weight: .medium))
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 8)
                            }
                        }
                        .aspectRatio(1, contentMode: .fit)
                    }
                }
            } else if viewStore.allergies.count <= 4 {
                
                let columns = [GridItem(.flexible(), spacing: 16),
                               GridItem(.flexible(), spacing: 16)]
                
                
                LazyVGrid(columns: columns, spacing: 16) {
                    
                    ForEach(viewStore.allergies) { allergy in
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 24)
                                .fill(.white)
                            
                            VStack {
                                Text(allergy.emoji)
                                    .font(.system(size: 60, weight: .semibold))
                                
                                let allergyName = language == .eng ? allergy.engName : allergy.korName
                                
                                Text(allergyName)
                                    .font(.system(size: 24, weight: .medium))
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 8)
                            }
                        }
                        .aspectRatio(1, contentMode: .fit)
                    }
                }
            } else if viewStore.allergies.count <= 9 {
                
                let columns = [GridItem(.flexible(), spacing: 16),
                               GridItem(.flexible(), spacing: 16),
                               GridItem(.flexible(), spacing: 16)]
                
                LazyVGrid(columns: columns, spacing: 16) {
                    
                    ForEach(viewStore.allergies) { allergy in
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 24)
                                .fill(.white)
                            
                            VStack {
                                Text(allergy.emoji)
                                    .font(.system(size: 40, weight: .semibold))
                                
                                let allergyName = language == .eng ? allergy.engName : allergy.korName
                                
                                Text(allergyName)
                                    .font(.system(size: 18, weight: .medium))
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 8)
                            }
                        }
                        .aspectRatio(1, contentMode: .fit)
                    }
                }
            } else {
                ChipLayout(verticalSpacing: 8, horizontalSpacing: 8) {
                 
                    ForEach(viewStore.allergies) { allergy in
                        chipView(title: "\(allergy.emoji) \(allergy.engName)")
                    }
                }
            }
        }
    }
}

private extension AllergyGridView {
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
