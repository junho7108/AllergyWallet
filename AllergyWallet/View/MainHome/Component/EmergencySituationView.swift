//
//  EmergencySituationView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/5/24.
//

import SwiftUI
import ComposableArchitecture

struct EmergencySituationView: View {
    
    var didTapButton: (() -> Void)? = nil
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(red: 0.96, green: 0.75, blue: 0.75))
            
            VStack(alignment: .leading, spacing: 8) {
                
                HStack {
                    Text("Emergency Situation")
                        .font(.system(size: 16))
                    
                    Spacer()
                    
                    Button { didTapButton?() } label: {
                        HStack {
                            Spacer()
                            Image("Icon_arrow")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                        
                    }
                    .frame(width: 40, height: 24)
                }
                
                Text("Use this when you need medical help due to an allergic reaction.")
                    .foregroundColor(.gray700)
                    .font(.system(size: 14))
                
                Spacer()
            }
            .padding(16)
        }
        .shadow(color: .black.opacity(0.1), radius: 5)
        .frame(height: 116)
    }
}

