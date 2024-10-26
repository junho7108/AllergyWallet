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
    
    struct State: Equatable {
        @Shared var users: [User]
        var profileEditState: IdentifiedArray<UUID, ProfileEditFeature.State>
        var isEditNicknameHidden: Bool = true
        
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
                    state.isEditNicknameHidden = false
                    return .none
                    
                case .editUser(let user):
                    if let index = state.users.firstIndex(where: { $0.id == user.id }) {
                        state.users[index] = user
                    }
             
                    return .send(.didClose)
             
                case .editComplete(let users):
                    state.users = users
                    return .none
                    
                default:
                    return .none
                }
                
            case .didClose:
                state.isEditNicknameHidden = true
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


