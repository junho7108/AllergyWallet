//
//  Coordinator.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import Foundation
import ComposableArchitecture
import TCACoordinators

@Reducer
struct Coordinator {
    
    @ObservableState
    struct State: Equatable {
        var routes: [Route<Screen.State>] = [.root(.splash(.init()))]
    }
    
    enum Action {
        case router(IndexedRouterActionOf<Screen>)
    }
    
    var body: some ReducerOf<Self> {
        
        Reduce<State, Action> { state, action in
            
            switch action {
            case .router(.routeAction(_, action: .splash(.navigationToSignUp))):
                state.routes = [.root(.signUp(.init()), embedInNavigationView: true)]
                return .none
                
            case .router(.routeAction(_, action: .splash(.navigationToMainHome(let users)))):
                state.routes = [.root(.mainHome(.init(users: Shared(users))), embedInNavigationView: true)]
                return .none
                
            case .router(.routeAction(_, action: .signUp(.navigateToSelectAllergies(let user)))):
                state.routes.push(.selectAllergy(.init(user: user)))
                return .none
                
            case .router(.routeAction(_, action: .selectAllergy(.navigationToRegisterCard(let user)))):
                state.routes.push(.registerEmergencyCard(.init(user: user)))
                return .none
                
            case .router(.routeAction(_, action: .registerEmergencyCard(.navigationToHome(let users)))):
                state.routes = [.root(.mainHome(.init(users: Shared(users))), embedInNavigationView: true)]
                return .none
                
            case .router(.routeAction(_, action: .mainHome(.navigationToAllergyGuide(let guide)))):
                switch guide {
                case .checkMenu(let user),
                        .recommendMenu(let user),
                        .requestAllergenFree(let user),
                        .checkCrossContamination(let user):
                    
                    state.routes.presentCover(.allergyGuideCard(.init(user: user,
                                                                      type: guide,
                                                                      grid: .init(allergies: user.allergries))))
                    return .none
                    
                case .emergencySituation(let user):
                    state.routes.presentCover(.emergencyCard(.init(user: user)))
                    return .none
                }
                
            case .router(.routeAction(_, action: .allergyGuideCard(.didTapBackButton))),
                    .router(.routeAction(_, action: .emergencyCard(.didTapBackButton))),
                    .router(.routeAction(_, action: .setting(.didTapBack))):
                state.routes.removeLast()
                return .none
    
            case .router(.routeAction(_, action: .mainHome(.navigationToSetting(let users)))):
                state.routes.push(.setting(.init(
                    users: users,
                    profileEditState: .init(uniqueElements: users.wrappedValue.map { user in
                        ProfileEditFeature.State(user: user)
                    })
                )))
                
                return .none
                    
            case .router(.routeAction(_, action: .mainHome(.naivgationToSignUp))):
                state.routes.push(.signUp(.init()))
                return .none
                
            default:
                return .none
            }
        }
        .forEachRoute(\.routes, action: \.router)
    }
}
