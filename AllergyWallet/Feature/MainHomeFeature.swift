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
        case checkMenu
        case recommendMenu
        case requestAllergenFree
        case checkCrossContamination
        case emergencySituation
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
