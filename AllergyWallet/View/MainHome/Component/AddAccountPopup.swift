//
//  AddAccountPopup.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 11/4/24.
//

import SwiftUI

struct AddAccountPopup: View  {
    
    var didTapCancel: (() -> Void)? = nil
    var didTapCreate: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.6)
                .ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
                    .overlay {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Add Allergy Account")
                                .font(.system(size: 16))
                                .foregroundColor(.gray700)
                                .padding(.bottom, 12)
                            
                            Text("Would you like to create another allergy account?")
                                .font(.system(size: 16))
                                .foregroundColor(.gray700)
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 24)
                            
                            HStack(spacing: 16) {
                                Button(action: { didTapCancel?() }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(.white)
                                            .stroke(Color.primary500, lineWidth: 0.8)
                                        
                                        Text("Cancel")
                                            .font(.system(size: 16))
                                            .foregroundColor(.primary500)
                                            .padding(.vertical, 10)
                                    }
                                }
                                .frame(height: 40)
                                
                                Button(action: { didTapCreate?() }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color.primary500)
                                        
                                        Text("Create")
                                            .font(.system(size: 16))
                                            .foregroundColor(.white)
                                            .padding(.vertical, 10)
                                    }
                                }
                                .frame(height: 40)
                            }
                        }
                        .padding(24)
                    }
                    .padding(.horizontal, 24)
                    .frame(maxHeight: 200)
                
                Spacer()
            }
        }
    }
}
