//
//  DeleteAccountPopup.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/27/24.
//

import SwiftUI

struct DeleteAccountPopup: View {
    
    @State var username: String
    
    var didTapCancel: (() -> Void)? = nil
    var didTapDelete: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.6)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
                    .overlay {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Delete \(username)")
                                .font(.system(size: 16))
                                .foregroundColor(.gray700)
                                .padding(.bottom, 12)
                            
                            Text("Would you like to delete \(username)'s allergy info?")
                                .font(.system(size: 16))
                                .foregroundColor(.gray700)
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 24)
                            
                            HStack(spacing: 16) {
                                Button(action: { didTapDelete?() }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(.white)
                                            .stroke(Color.primary500, lineWidth: 0.8)
                                        
                                        Text("Delete")
                                            .font(.system(size: 16))
                                            .foregroundColor(.primary500)
                                            .padding(.vertical, 10)
                                    }
                                }
                                .frame(height: 40)
                                
                                Button(action: { didTapCancel?() }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color.primary500)
                                        
                                        Text("Cancel")
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
