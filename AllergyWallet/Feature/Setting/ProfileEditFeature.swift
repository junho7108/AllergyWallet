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
        case didTapEditNickname(User)
        case didTapEditAllergySelection(User)
        case didTapEditEmergencyContactInfo(User)
        case didTapDeleteAccount(User)
        
        case editUserName(String)
        case deleteUser(User)
        
        case updateUser(User)
        case updateUserList([User])
    }
    
    @Dependency(\.editUserProfileUsecase) var usecase: EditUserProfileUseCase
    
    var body: some Reducer<State, Action> {
        
        Reduce { state, action in
            switch action {
            case .editUserName(let name):
                state.user.name = name
                return .send(.updateUser(state.user))
                
            case .deleteUser(let user):
                return .run { send in
                    let users = usecase.deleteUser(user: user)
                    await send(.updateUserList(users))
                }
                
            case .updateUser(let user):
                state.user = user
                
                return .run { send in
                    let users = usecase.replaceUser(user: user)
                    await send(.updateUserList(users))
                }
                
            default:
                return .none
            }
        }
    }
}
