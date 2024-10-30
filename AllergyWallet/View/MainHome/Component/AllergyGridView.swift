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
                                
                                Text(allergy.engName)
                                    .font(.system(size: 24, weight: .medium))
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
                                
                                Text(allergy.engName)
                                    .font(.system(size: 24, weight: .medium))
                            }
                        }
                        .aspectRatio(1, contentMode: .fit)
                    }
                }
            } else {
                
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
                                
                                Text(allergy.engName)
                                    .font(.system(size: 18, weight: .medium))
                            }
                        }
                        .aspectRatio(1, contentMode: .fit)
                    }
                }
            }
        }
    }
}
