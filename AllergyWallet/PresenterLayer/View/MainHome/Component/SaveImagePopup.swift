//
//  SaveImagePopup.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 11/8/24.
//

import SwiftUI

struct SaveImagePopup: View {
    
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
                        Text("Your allergy card has been saved to your photo album.")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.primary500)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(24)
                    }
                    .padding(.horizontal, 24)
                    .frame(height: 106)
                
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
