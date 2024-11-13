//
//  EmergencyCardFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/7/24.
//

import ComposableArchitecture

@Reducer
struct EmergencyCardFeature {
    
    struct State: Equatable {
        var user: User
        var languageState: LanguageFeature.State = .init()
    }
    
    enum Action {
        case languageAction(LanguageFeature.Action)
        case didTapBackButton
    }
    
    var body: some Reducer<State, Action> {
        
        Scope(state: \.languageState, action: \.languageAction) {
            LanguageFeature()
        }
        
        Reduce { state, action in
            switch action {
           
                
            default:
                return .none
            }
        }
    }
}
