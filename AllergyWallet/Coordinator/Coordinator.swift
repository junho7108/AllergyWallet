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
                state.routes = [.root(.registerUsername(.init()), embedInNavigationView: true)]
                return .none
                
            case .router(.routeAction(_, action: .splash(.navigationToMainHome(let users)))):
                state.routes = [.root(.mainHome(.init(users: Shared(users))), embedInNavigationView: true)]
                return .none
                
            case .router(.routeAction(_, action: .registerUsername(.navigateToSelectAllergies(let user)))):
                state.routes.push(.registerSelectAllergy(.init(user: user)))
                return .none
                
            case .router(.routeAction(_, action: .registerSelectAllergy(.navigationToRegisterCard(let user)))):
                state.routes.push(.registerEmergencyCard(.init(user: user)))
                return .none
                
            case .router(.routeAction(_, action: .registerEmergencyCard(.navigationToHome(let users)))):
                state.routes.presentCover(.mainHome(.init(users: Shared(users))), embedInNavigationView: true)
              
//                let canGoBack: Bool = state.routes.goBackTo { [state] route in
//                    if case let .mainHome = route.screen, let _ = state.mainId { return true }
//                    return false
//                }
//                
//                print("🟢 canGoBack \(canGoBack)")
//                if canGoBack, let mainId = state.mainId {
//                    return .send(.router(.routeAction(id: mainId, action: .mainHome(.updateUsers(users)))))
//                } else {
//                    state.routes.presentCover(.mainHome(.init(users: Shared(users))), embedInNavigationView: true)
//                }
                
                return .none
                
            case .router(.routeAction(_, action: .mainHome(.navigationToSignUp))):
                state.routes.push(.registerUsername(.init()))
                return .none
                
            //MARK: Home
            case .router(.routeAction(_, action: .mainHome(.navigationToAllergyGuide(let guide)))):
                switch guide {
                case .myAllergyInfo(let user):
                    state.routes.presentCover(.myAllergyInfo(.init(user: user,
                                                                   type: guide,
                                                                   grid: .init(allergies: user.allergries))))
                    return .none
                    
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
                
                
            //MARK: Setting
            case .router(.routeAction(_, action: .mainHome(.navigationToSetting(let users)))):
                state.routes.push(.setting(.init(
                    users: users,
                    profileEditState: .init(uniqueElements: users.wrappedValue.map { user in
                        ProfileEditFeature.State(user: user)
                    })
                )))
                
                return .none
                
            case .router(.routeAction(_, action: .setting(.profileEditAction(_, action: .didTapEditAllergySelection(let user))))):
                state.routes.push(.editSelectedAllergy(.init(user: user)))
                return .none
                
            case .router(.routeAction(_, action: .setting(.profileEditAction(_, action: .didTapEditEmergencyContactInfo(let user))))):
                state.routes.push(.editEmergencyCard(.init(user: user)))
                return .none
                
            case .router(.routeAction(let id, action: .editSelectedAllergy(.didSaveAllergyChanges(let user)))),
                    .router(.routeAction(let id, action: .editEmergencyCard(.didSaveEmergencyChanges(let user)))):
        
                state.routes.goBack()
                
                return .send(.router(.routeAction(id: id - 1, action: .setting(.profileEditAction(id: user.id,
                                                                                      action: .updateUser(user))))))
                
            //MARK: go Back
            case .router(.routeAction(_, action: .myAllergyInfo(.didTapBackButton))),
                    .router(.routeAction(_, action: .allergyGuideCard(.didTapBackButton))),
                    .router(.routeAction(_, action: .emergencyCard(.didTapBackButton))),
                    .router(.routeAction(_, action: .setting(.didTapBack))),
                    .router(.routeAction(_, action: .editSelectedAllergy(.didTapBackButton))),
                    .router(.routeAction(_, action: .editEmergencyCard(.didTapCancel))):
                
                state.routes.goBack()
                return .none
            
            default:
                return .none
            }
        }
        .forEachRoute(\.routes, action: \.router)
    }
}
