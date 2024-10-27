//
//  SettingFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/8/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct SettingFeature {
    
    enum SettingPopupType: Equatable {
        case editNickname
        case deleteAccount
        case none
    }
    
    struct State: Equatable {
        @Shared var users: [User]
        var profileEditState: IdentifiedArray<UUID, ProfileEditFeature.State>
        var popupState: SettingPopupType = .none
        var selectedUser: User? = nil
    }
    
    enum Action {
        case didTapBack
        case didClose
        case profileEditAction(id: UUID, action: ProfileEditFeature.Action)
    }
    
    var body: some Reducer<State, Action> {
        
        Reduce { state, action in
            
            switch action {
                
            case .profileEditAction(let id, let editAction):
                state.selectedUser = state.users.first(where: { $0.id == id })
                
                switch editAction {
                case .didTapEditNickname:
                    state.popupState = .editNickname
                    return .none
                    
                case .didTapDeleteAccount:
                    state.popupState = .deleteAccount
                    return .none
                    
                case .updateUserList(let users):
                    state.users = users
                    return .send(.didClose)
                    
                default:
                    return .none
                }
                
            case .didClose:
                state.popupState = .none
                return .none
                
            default:
                return .none
            }
        }
        .forEach(\.profileEditState, action: /Action.profileEditAction) {
            ProfileEditFeature()
        }
    }
}


