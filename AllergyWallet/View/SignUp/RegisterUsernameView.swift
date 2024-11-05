//
//  RegisterUsernameView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct RegisterUsernameView: View {
    
    let store: StoreOf<RegisterUsernameFeature>

    var body: some View {
        
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Choose Nickname for Allergy Wallet")
                    .font(.system(size: 28, weight: .semibold))
                    .padding(.bottom, 48)

               
               UsernameTextField(placeholder: "Nickname", textBinding: Binding<String>(
                get: { viewStore.username },
                set: { viewStore.send(.didChangeNickname($0)) }
               ))
               .padding(.vertical, 12)
               .frame(height: 53)
              
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(
                        viewStore.isValidNickname.map { $0 ? Color.green : Color.red }
                        ?? Color.gray200
                    )
                    .padding(.bottom, 4)
                
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
            .padding()
        }
    }
}

private extension RegisterUsernameView {
    struct UsernameTextField: View {
        
        private(set) var maxCount: Int = 20
        
        var placeholder: String
        
        var textBinding: Binding<String>
        
        var body: some View {
            TextField(placeholder, text: textBinding)
                .textFieldStyle(.plain)
                .onChange(of: textBinding.wrappedValue) { oldValue, newValue in
                    if newValue.count > maxCount {
                        textBinding.wrappedValue = String(newValue.prefix(maxCount))
                    }
                }
                .textFieldStyle(.plain)
                .overlay {
                    HStack {
                        Spacer()
                        
                        Text("(\(textBinding.wrappedValue.count)/\(maxCount))")
                            .font(.system(size: 14))
                            .foregroundColor(.gray500)
                    }
                }
        }
    }
}
