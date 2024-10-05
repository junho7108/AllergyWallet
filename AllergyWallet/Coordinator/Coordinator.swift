//
//  Coordinator.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

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
                state.routes.removeAll()
                state.routes = [.root(.signUp(.init()),
                                      embedInNavigationView: true)]
                return .none
                
            case .router(.routeAction(_, action: .splash(.navigationToMainHome(let user)))):
                state.routes.removeAll()
                state.routes = [.root(.mainHome(.init(user: user)),
                                      embedInNavigationView: true)]
                return .none
                
            case .router(.routeAction(_, action: .signUp(.navigateToSelectAllergies(let user)))):
                state.routes.push(.selectAllergy(.init(user: user)))
                return .none
                
            case .router(.routeAction(_, action: .selectAllergy(.navigationToRegisterCard(let user)))):
                state.routes.push(.registerEmergencyCard(.init(user: user)))
                return .none
                
            case .router(.routeAction(_, action: .registerEmergencyCard(.navigationToHome(let user)))):
                state.routes.removeAll()
                state.routes = [.root(.mainHome(.init(user: user)),
                                      embedInNavigationView: true)]
                return .none
                
            default:
                return .none
            }
        }
        .forEachRoute(\.routes, action: \.router)
    }
}
