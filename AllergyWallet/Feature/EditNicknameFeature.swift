//
//  EditNicknameFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/8/24.
//

import ComposableArchitecture

@Reducer
struct  EditNicknameFeature {
    
    struct State: Equatable {
        var username: String
    }
    
    enum Action {
        case didChangeUserName(String)
        case didTapCancel
        case didTapSave(String)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .didChangeUserName(let name):
                state.username = name
                return .none
                
            default:
                return .none
            }
        }
    }
}

