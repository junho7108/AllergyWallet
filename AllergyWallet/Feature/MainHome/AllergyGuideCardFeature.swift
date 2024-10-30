//
//  AllergyGuideCardFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/5/24.
//

import ComposableArchitecture

@Reducer
struct AllergyGuideCardFeature {
    
    struct State: Equatable {
        let user: User
        let type: AllergyGuideType
        var grid: AllergyGridState
        var languageState: LanguageFeature.State = .init()
        var hasAllergen: Bool?
    }
    
    enum Action {
        case didTapBackButton
        case languageAction(LanguageFeature.Action)
        case didTapAllergenIncluded(Bool)
    }
    
    var body: some Reducer<State, Action> {
        
        Scope(state: \.languageState, action: \.languageAction) {
            LanguageFeature()
        }
        
        Reduce { state, action in
            switch action {
           
            case .didTapAllergenIncluded(let selected):
                state.hasAllergen = selected
                return .none
                
            default:
                return .none
            }
        }
    }
}
