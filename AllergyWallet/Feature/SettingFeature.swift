//
//  SettingFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/8/24.
//

import ComposableArchitecture

@Reducer
struct SettingFeature {
    
    struct State: Equatable {
        var user: User
        var profileEditState: ProfileEditFeature.State
    }
    
    enum Action {
        case didTapBack
        case profileEditAction(ProfileEditFeature.Action)
    }
    
    var body: some Reducer<State, Action> {
        
        Scope(state: \.profileEditState, action: \.profileEditAction) {
            ProfileEditFeature()
        }
        
        Reduce { state, action in
            switch action {
                
            default:
                return .none
            }
        }
    }
}
