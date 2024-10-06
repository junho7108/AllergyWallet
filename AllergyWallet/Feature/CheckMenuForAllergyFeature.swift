//
//  CheckMenuForAllergyFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/5/24.
//

import ComposableArchitecture

@Reducer
struct CheckMenuForAllergyFeature {
    
    struct State: Equatable {
        var user: User
        var grid: AllergyGridState
        var languageState: LanguageFeature.State = .init()
    }
    
    enum Action {
        case didTapBackButton
        case languageAction(LanguageFeature.Action)
    }
    
    var body: some Reducer<State, Action> {
        
        Scope(state: \.languageState, action: \.languageAction) {
            LanguageFeature()
                ._printChanges()
        }
        
        Reduce { state, action in
            switch action {
            case .didTapBackButton:
                return .none
                
            case .languageAction(.didChangeLanguage(_)):
                return .none
            }
        }
    }
}
