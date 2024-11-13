//
//  LanguageFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/6/24.
//

import ComposableArchitecture

@Reducer
struct LanguageFeature {
    
    struct State: Equatable {
        var language: LanguageType = Const.language
    }
    
    enum Action {
        case didChangeLanguage(LanguageType)
    }
    
    var body: some Reducer<State, Action> {
        
        Reduce { state, action in
            switch action {
            case .didChangeLanguage(let language):
                Const.language = language
                state.language = language
                return .none
            }
        }
    }
}
