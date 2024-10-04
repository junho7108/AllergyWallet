//
//  SignUpView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct SignUpView: View {
    
    let store: StoreOf<SignUpFeature>
    
    init(store: StoreOf<SignUpFeature>) {
        self.store = store
    }
    
    var body: some View {
        
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            VStack(alignment: .leading) {
                Text("Choose Nickname for Allergy Wallet")
                    .font(.system(size: 28, weight: .semibold))
                    .padding(.bottom, 48)
                
                TextField("Nickname", text: Binding<String>(
                    get: { viewStore.username ?? "" },
                    set: { viewStore.send(.didChangeNickname($0)) }
                     
                ))
                .textFieldStyle(.plain)

                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(
                        viewStore.isValidNickname.map { $0 ? Color.green : Color.red }
                        ?? Color.gray200
                    )
                
                Text("Use only letters, numbers, dashes and underscores")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 14))
                    .foregroundColor(
                        viewStore.isValidNickname.map { $0 ? Color.gray200 : Color.red }
                        ?? Color.gray200
                    )
                
                Spacer()
                
                Button(action: {
                    viewStore.send(.createUser)
                }) {
                    Text("Next")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 51)
                        .background(Color.primary500)
                        .cornerRadius(12)
                }
                .disabled(!(viewStore.isValidNickname ?? false))
            }
            .padding([.top, .leading, .trailing], 24)
        }
    }
}
