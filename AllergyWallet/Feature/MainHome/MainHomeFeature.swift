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
        var currentPage: Int = 0
        var currentUser: User? = nil
    }
    
    enum Action {
        case setCurrentPage(Int)
        case didTapCreateAccount
      
        case navigationToAllergyGuide(AllergyGuideType)
        case navigationToSetting(Shared<[User]>)
        case naivgationToSignUp
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .setCurrentPage(let pageIndex):
                guard pageIndex < state.users.count + 1 else {
                    state.currentPage = 0
                    state.currentUser = state.users[safe: 0]
                    return .none
                }
                
                state.currentPage = pageIndex
                state.currentUser = state.users[safe: pageIndex]
                return .none
                
            case .didTapCreateAccount:
                return .send(.naivgationToSignUp)
            
            default:
                return .none
            }
        }
    }
}
