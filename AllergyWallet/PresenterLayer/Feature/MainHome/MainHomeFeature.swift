//
//  MainHomeFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/3/24.
//

import ComposableArchitecture

@Reducer
struct MainHomeFeature {
    
    enum MainPopupType {
        case addAccount
        case none
    }

    struct State: Equatable {
        @Shared var users: [User]
        var currentPage: Int = 0
        var currentUser: User? = nil
        var popupState: MainPopupType = .none
    }
    
    enum Action {
        case updateUsers([User])
        case setCurrentPage(Int)
        
        case didTapCreateAccount
      
        case closePopup
        case navigationToAllergyGuide(AllergyGuideType)
        case navigationToSetting(Shared<[User]>)
        case navigationToSignUp
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .updateUsers(let users):
                state.users = users
                return .none
                
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
                state.popupState = .addAccount
                return .none

            case .closePopup:
                state.popupState = .none
                return .none
                
            case .navigationToSignUp:
                return .send(.closePopup)
                
            default:
                return .none
            }
        }
    }
}
