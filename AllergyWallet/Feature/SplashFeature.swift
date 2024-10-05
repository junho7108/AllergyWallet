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
        case navigationToMainHome(User)
    }
    
    @Dependency(\.splashUsecase) var usecase: SplashUsecase
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .fetchUser:
                return .run { send in
                    let user = await usecase.fetchUser()
                    
                    if let user {
                        print("🟢 유저 정보 \(user)")
                        await send(.navigationToMainHome(user))
                    } else {
                        print("🟢 로그인 정보 없음")
                        await send(.navigationToSignUp)
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
