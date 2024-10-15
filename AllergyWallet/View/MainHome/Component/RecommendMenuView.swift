//
//  RecommendMenuView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/5/24.
//

import SwiftUI
import ComposableArchitecture

struct RecommendMenuView: View {
    
    var didTapButton: (() -> Void)? = nil
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Recommend a Menu")
                        .font(.system(size: 16))
                    
                    Spacer()
                    
                    Button {  didTapButton?() } label: {
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

