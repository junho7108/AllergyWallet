//
//  CreateAccountView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/15/24.
//

import SwiftUI

struct CreateAccountView: View {
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(hex: "#DFF3EC"))
           
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
                
                
               
                Spacer()
            }
        }
        .shadow(color: .black.opacity(0.1), radius: 5)
        .frame(maxWidth: .infinity, maxHeight: 248)
    }
}
