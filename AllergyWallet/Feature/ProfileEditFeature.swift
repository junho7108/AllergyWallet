//
//  ProfileEditFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/8/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct ProfileEditFeature {
    
    struct State: Equatable, Identifiable {
        var user: User
        
        var id: UUID { return user.id }
    }
    
    enum Action {
        case didTapEditNickname
        case didTapEditAllergySelection(User)
        case didTapEditEmergencyContactInfo
        case didTapDeleteAccount
        
        case editUserName(String)
        
        case editUser(User)
        case editComplete([User])
    }
    
    @Dependency(\.editUserProfileUsecase) var usecase: EditUserProfileUseCase

    var body: some Reducer<State, Action> {
        
        Reduce { state, action in
            switch action {
            case .editUser(let user):
                state.user = user
               
                return .run { send in
                    let users = usecase.replaceUser(user: user)
                    await send(.editComplete(users))
                }
                
            case .editUserName(let name):
                state.user.name = name
                return .send(.editUser(state.user))
                
            default:
                return .none
            }
        }
    }
}
