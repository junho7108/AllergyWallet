//
//  SettingView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/8/24.
//

import SwiftUI
import ComposableArchitecture

struct SettingView: View {
    
    let store: StoreOf<SettingFeature>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            ZStack {
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    SettingTopView { viewStore.send(.didTapBack) }
                        .padding(.bottom, 24)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        Text("Registered Info")
                            .font(.system(size: 14))
                            .foregroundColor(.gray700)
                            .padding(.bottom, 12)
                        
                        ForEach(viewStore.users) { user in
                            IfLetStore(store.scope(
                                state: \.profileEditState[id: user.id],
                                action: { SettingFeature.Action.profileEditAction(id: user.id, action: $0) })) { store in
                                    ProfileEditView(store: store, enableDeleteAcctount: viewStore.users.count > 1)
                                        .padding(.bottom, 16)
                                }
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 24)
                
                if viewStore.popupState != .none,
                   let selectedUserId = viewStore.selectedUser?.id,
                   let user = viewStore.users.first(where: { $0.id == selectedUserId }) {
                    
                    switch viewStore.popupState {
                    case .editNickname:
                        EditNicknamePopup(username: user.name) {
                            viewStore.send(.didClose)
                        } didTapSave: { name in
                            viewStore.send(.profileEditAction(id: user.id, action: .editUserName(name)))
                        }
                    case .deleteAccount:
                        DeleteAccountPopup(username: user.name) {
                            viewStore.send(.didClose)
                        } didTapDelete: {
                            viewStore.send(.profileEditAction(id: user.id, action: .deleteUser(user)))
                        }
                        
                    case .none:
                        EmptyView()
                    }
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}
