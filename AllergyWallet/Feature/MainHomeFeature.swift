//
//  MainHomeFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/3/24.
//

import ComposableArchitecture

@Reducer
struct MainHomeFeature {
    
    enum MenuOption {
        case checkMenu(User)
        case recommendMenu(User)
        case requestAllergenFree(User)
        case checkCrossContamination(User)
        case emergencySituation(User)
    }
    
    struct State: Equatable {
        var user: User
    }
    
    enum Action {
        case navigationToMenuOption(MenuOption)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .navigationToMenuOption(let option):
                print("🟢 \(action)")
                
                return .none
            }
        }
    }
}
