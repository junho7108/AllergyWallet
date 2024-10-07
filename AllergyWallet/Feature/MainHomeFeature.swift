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
    }
    
    enum Action {
        case navigationToAllergyGuide(AllergyGuideType)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .navigationToAllergyGuide:
                return .none
            }
        }
    }
}
