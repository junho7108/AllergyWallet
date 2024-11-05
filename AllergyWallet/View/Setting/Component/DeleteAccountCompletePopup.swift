//
//  DeleteAccountCompletePopup.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 11/1/24.
//

import SwiftUI
import Foundation

struct DeleteAccountCompletePopup: View {
    
    @State var username: String
   
    var didClose: (() -> Void)? = nil
    
    @State private var closeWorkItem: DispatchWorkItem?
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.6)
                .ignoresSafeArea(.all)
                .onTapGesture { didClose?() }
            
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
                            
                            Text(username)
                                .font(.system(size: 18))
                                .foregroundColor(.primary500)
                                .multilineTextAlignment(.center)
                                .frame(height: 29)
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                            Text("Nickname has been deleted.")
                                .font(.system(size: 16))
                                .foregroundColor(.gray700)
                                .multilineTextAlignment(.center)
                                .frame(height: 26)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .padding(24)
                    }
                    .padding(.horizontal, 24)
                    .frame(maxHeight: 141)
                
                Spacer()
            }
        }
        .onAppear {
            closeWorkItem = DispatchWorkItem { didClose?() }
        
            if let closeWorkItem {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: closeWorkItem)
            }
        }
        .onDisappear {
            closeWorkItem?.cancel()
        }
    }
}
