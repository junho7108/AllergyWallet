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
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(hex: "#DFF3EC"))
            
            Image("Character")
                .resizable()
                .scaledToFit()
                .frame(width: 194)
                .padding(.trailing, 12)
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text("My Allegry Info")
                        .font(.system(size: 16))
                    
                    Spacer()
                    
                    Button { } label: {
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
                .frame(height: 24)
                .padding(16)
                
                
                let columns = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
                
                
                LazyVGrid(columns: columns) {
                    ForEach(allergies) { allergy in
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.white)
                            
                            Text("\(allergy.emoji) \(allergy.engName)")
                                .padding(.horizontal, 12)
                                .padding(.vertical, 2)
                            
                        }
                        .fixedSize()
                        
                    }
                }
                .background(.red)
                .padding(.horizontal, 16)
                
                Spacer()
            }
        }
        .shadow(color: .black.opacity(0.1), radius: 5)
        .frame(maxWidth: .infinity, maxHeight: 248)
    }
}
