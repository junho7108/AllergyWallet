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
    }
    
    enum Action {
        case didTapBackButton
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .didTapBackButton:
                return .none
            }
        }
    }
}
