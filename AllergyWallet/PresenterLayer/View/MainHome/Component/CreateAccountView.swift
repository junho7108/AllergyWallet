//
//  CreateAccountView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/15/24.
//

import SwiftUI

struct CreateAccountView: View {
    
    var didTapCreateAccount: (() -> Void)? = nil
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(hex: "#DFF3EC"))
                .opacity(0.4)
           
            VStack(alignment: .leading, spacing: 58) {
                
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
                .opacity(0.4)
                .frame(height: 24)
               
                HStack {
                    Spacer()
                    
                    Button {
                        didTapCreateAccount?()
                    } label: {
                        VStack(alignment: .center) {
            
                            Image("Icon_plus")
                                .resizable()
                                .scaledToFit()
                                .padding(8)
                                .frame(width: 32, height: 32, alignment: .center)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .inset(by: 0.5)
                                        .stroke(.black, lineWidth: 1)
                                )
                         
                            Text("Add Allergy Account")
                                .font(.system(size: 18))
                                .foregroundColor(.gray700)
                        }
                    }
 
                    Spacer()
                }
                Spacer()
            }
            .padding(16)
        }
        .frame(height: 248)
        .shadow(color: .black.opacity(0.1), radius: 5)
    }
}
