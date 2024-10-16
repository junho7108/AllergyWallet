//
//  SplashFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/5/24.
//

import ComposableArchitecture

@Reducer
struct SplashFeature {
    
    struct State: Equatable {

    }
    
    enum Action {
        case fetchUser
        case navigationToSignUp
        case navigationToMainHome([User])
    }
    
    @Dependency(\.splashUsecase) var usecase: SplashUsecase
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .fetchUser:
                return .run { send in
                    let users = await usecase.fetchUser()
        
                    if users.isEmpty {
                        await send(.navigationToSignUp)
                    } else {
                        await send(.navigationToMainHome(users))
                    }
                }
                
            case .navigationToSignUp:
                return .none
            case .navigationToMainHome:
                return .none
            }
        }
    }
}
