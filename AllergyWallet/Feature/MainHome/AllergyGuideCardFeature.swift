//
//  AllergyGuideCardFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/5/24.
//

import ComposableArchitecture

@Reducer
struct AllergyGuideCardFeature {
    
    enum AllergyGuidPopupType {
        case saveImage
        case none
    }
    
    struct State: Equatable {
        let user: User
        let type: AllergyGuideType
        var grid: AllergyGridState
        var languageState: LanguageFeature.State = .init()
        var hasAllergen: Bool?
        
        var popupState: AllergyGuidPopupType = .none
    }
    
    enum Action {
        case didTapBackButton
        case languageAction(LanguageFeature.Action)
        case didTapAllergenIncluded(Bool)
        case saveImage
        case closePopup
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
                
            case .saveImage:
                state.popupState = .saveImage
                return .none
                
            case .closePopup:
                state.popupState = .none
                return .none
     
            default:
                return .none
            }
        }
    }
}
