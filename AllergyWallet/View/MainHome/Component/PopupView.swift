//
//  PopupView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/7/24.
//

import SwiftUI

struct PopupView: View {
    
    let title: String
    let description: String
    let cancelText: String
    let confirmText: String
    
    let cancel: (() -> Void)
    let confirm: (() -> Void)
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.6)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .frame(maxWidth: .infinity, maxHeight: 200)
                    
                    VStack(alignment: .leading, spacing: 24) {
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text(title)
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.black)
                            
                            Text(description)
                                .font(.system(size: 16))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                        }
              
                        HStack(spacing: 16) {
                            Button(action: { cancel() }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.white)
                                        .stroke(Color.primary500, lineWidth: 0.8)
                                    
                                    Text(cancelText)
                                        .font(.system(size: 16))
                                        .foregroundColor(.primary500)
                                        .padding(.vertical, 10)
                                }
                            }
                            .frame(height: 40)
                            
                            Button(action: { confirm() }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.primary500)
                                    
                                    Text(confirmText)
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
                .padding(24)
                
                Spacer()
            }
        }
    }
}

