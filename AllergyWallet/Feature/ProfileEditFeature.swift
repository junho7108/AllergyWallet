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
        var id: UUID { user.id }
    }
    
    enum Action {
        case didTapEditNickname
        case didTapEditAllergySelection
        case didTapEditEmergencyContactInfo
        case didTapDeleteAccount
        
        case editUserName(String)
        case editUser(User)
    }
    
    @Dependency(\.editUserProfileUsecase) var usecase: EditUserProfileUseCase

    
    var body: some Reducer<State, Action> {
        
        Reduce { state, action in
            switch action {
            case .editUser(let user):
                return .run { send in
                    let result = usecase.replaceUser(user: user)
                    print("🟢 result \(result.map { $0.name })")
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
