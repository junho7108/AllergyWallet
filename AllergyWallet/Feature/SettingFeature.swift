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
        var users: [User]
        var profileEditState: IdentifiedArray<UUID, ProfileEditFeature.State>
        var isEditNicknameHidden: Bool = true
        
        var selectedUser: User? = nil
        
        init(users: [User]) {
            self.users = users
            self.profileEditState = IdentifiedArray(uniqueElements: users.map { user in
                ProfileEditFeature.State(user: user)
            })
        }
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
                    
                case .editUserName:
                    return .send(.didClose)
                    
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


