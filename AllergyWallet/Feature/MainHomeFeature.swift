//
//  MainHomeFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/3/24.
//

import ComposableArchitecture

@Reducer
struct MainHomeFeature {
    
    struct State: Equatable {
        var user: User
        var isPopupVisible: Bool = false
    }
    
    enum Action {
        case showEmergencyPopup(Bool)
        case navigationToAllergyGuide(AllergyGuideType)
        case navigationToCreateEmergencyCard(User)
        case navigationToSetting(User)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .navigationToAllergyGuide:
                return .none
                
            case .showEmergencyPopup(let visible):
                state.isPopupVisible = visible
                return .none
                
            case .navigationToCreateEmergencyCard:
                return .send(.showEmergencyPopup(false))
                
            default:
                return .none
            }
        }
    }
}
