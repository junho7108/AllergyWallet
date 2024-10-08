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
                
                VStack(alignment: .leading, spacing: 24) {
                    SettingTopView { viewStore.send(.didTapBack) }
                    
                    Text("Registered Info")
                        .font(.system(size: 14))
                        .foregroundColor(.gray700)
                    
                    ProfileEditView(store: store.scope(state: \.profileEditState, action: \.profileEditAction))
                    
                    Spacer()
                }
                .padding(.horizontal, 24)
             
                if viewStore.profileEditState.isEditNicknamePopupVisible {
                    
                    EditNicknamePopup(store: store.scope(state: \.profileEditState.editNicknameState,
                                                         action: \.profileEditAction.editNicknameAction))
                }
            }
        }
    }
}
