//
//  EditNicknamePopup.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/8/24.
//

import SwiftUI
import ComposableArchitecture

struct EditNicknamePopup: View {
    
    let store: StoreOf<EditNicknameFeature>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            ZStack {
                Color.black.opacity(0.6)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                            .frame(maxWidth: .infinity, maxHeight: 200)
                        
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Edit Nickname")
                                .font(.system(size: 16))
                                .foregroundColor(.gray700)
                            
                            ZStack {
                                TextField("Name", text: Binding<String>(
                                    get: { viewStore.username },
                                    set: { viewStore.send(.didChangeUserName($0)) }
                                     
                                ))
                                .textFieldStyle(.plain)
                                
                                HStack {
                                    Spacer()
                                    
                                    Button {
                                        
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
                            
                            HStack(spacing: 16) {
                                Button(action: { viewStore.send(.didTapCancel) }) {
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
                                
                                Button(action: { viewStore.send(.didTapSave(viewStore.username)) }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color.primary500)
                                        
                                        Text("Save")
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
}

