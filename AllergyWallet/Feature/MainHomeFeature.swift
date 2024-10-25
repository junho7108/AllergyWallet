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
        @Shared var users: [User]
    }
    
    enum Action {
        case didTapCreateAccount
        
        case navigationToAllergyGuide(AllergyGuideType)
        case navigationToSetting(Shared<[User]>)
        case naivgationToSignUp
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .didTapCreateAccount:
                print("🟢 didTapCreateAccount")
                return .send(.naivgationToSignUp)
            
            default:
                return .none
            }
        }
    }
}
