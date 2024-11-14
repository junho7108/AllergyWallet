//
//  EditNicknamePopup.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/8/24.
//

import SwiftUI
import ComposableArchitecture

struct EditNicknamePopup: View {
    
    @State var username: String
    
    private let originname: String
    
    var didTapCancel: (() -> Void)? = nil
    var didTapSave: ((String) -> Void)? = nil
    
    @FocusState private var isEditing: Bool
    
    init(username: String, didTapCancel: (() -> Void)? = nil, didTapSave: ((String) -> Void)? = nil) {
        self.username = username
        self.originname = username
        self.didTapCancel = didTapCancel
        self.didTapSave = didTapSave
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.6)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("Edit Nickname")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.gray700)
                        .padding(.bottom, 12)
                    
                    ZStack {
                        TextField("Name", text: $username)
                            .focused($isEditing)
                            .textFieldStyle(.plain)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 12)
                            .overlay {
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(isEditing ? (isValidNickname(nickname: username) || username.isEmpty ? Color.primary500 : Color.semanticError) : Color.gray200, lineWidth: 1)
                            }
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                username.removeAll()
                            } label: {
                                Image("Icon_close")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                            }
                            .frame(width: 32, height: 32)
                        }
                    }
                    .background(Color.gray50)
                    .cornerRadius(4)
                    .padding(.bottom, 6)
                    
                    if isEditing && !isValidNickname(nickname: username) && !username.isEmpty {
                        Text("Use only alphabets, numbers, dashes, and underscores")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.semanticError)
                            .padding(.bottom, 24)
                    } else {
                        Spacer()
                            .frame(height: 18)
                    }
                    
                    HStack(spacing: 16) {
                        Button(action: { didTapCancel?() }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.primary500, lineWidth: 0.8)
                                    )
                                
                                Text("Cancel")
                                    .font(.system(size: 16))
                                    .foregroundColor(.primary500)
                                    .padding(.vertical, 10)
                            }
                        }
                        .frame(height: 40)
                        
                        Button(action: { didTapSave?(username) }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(isValidNickname(nickname: username) ? Color.primary500 : Color.gray200)
                                
                                Text("Save")
                                    .font(.system(size: 16))
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                            }
                        }
                        .disabled(!isValidNickname(nickname: username))
                        .frame(height: 40)
                    }
                }
                .padding(24)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
                .padding(.horizontal, 24)
                
                Spacer()
            }
        }
    }
}

private extension EditNicknamePopup {
    func isValidNickname(nickname: String) -> Bool {
//        guard nickname != originname else { return false }
        
        let pattern = "^(?=.*[a-zA-Z0-9])[-_a-zA-Z0-9]{1,20}$"
        
        let regex = try? NSRegularExpression(pattern: pattern)
        
        let range = NSRange(location: 0, length: nickname.utf16.count)
        
        return regex?.firstMatch(in: nickname, options: [], range: range) != nil
    }
}
