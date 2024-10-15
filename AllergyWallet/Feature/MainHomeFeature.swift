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
        var users: [User]
    }
    
    enum Action {
        case navigationToAllergyGuide(AllergyGuideType)
        case navigationToCreateEmergencyCard(User)
        case navigationToSetting([User])
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .navigationToAllergyGuide:
                return .none
            
            case .navigationToCreateEmergencyCard:
                return .none
                
            default:
                return .none
            }
        }
    }
}
