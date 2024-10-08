//
//  ProfileEditFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/8/24.
//

import ComposableArchitecture

@Reducer
struct ProfileEditFeature {
    
    struct State: Equatable {
        var user: User
        var isEditNicknamePopupVisible = false
        
        var editNicknameState: EditNicknameFeature.State
    }
    
    enum Action {
        case didTapEditNickname
        case didTapEditAllergySelection
        case didTapEditEmergencyContactInfo
        case didTapDeleteAccount
        
        case showEditNicknamePopup(Bool)
        
        case editNicknameAction(EditNicknameFeature.Action)
    }
    
    var body: some Reducer<State, Action> {
        
        Scope(state: \.editNicknameState, action: \.editNicknameAction) {
            EditNicknameFeature()
        }
        
        Reduce { state, action in
            switch action {
            case .didTapEditNickname:
                state.isEditNicknamePopupVisible = true
                return .send(.showEditNicknamePopup(true))
                
            case .didTapEditAllergySelection:
                return .none
                
            case .didTapEditEmergencyContactInfo:
                return .none
                
            case .didTapDeleteAccount:
                return .none
                
            case .editNicknameAction(.didTapSave(let username)):
                state.isEditNicknamePopupVisible = false
                return .send(.showEditNicknamePopup(false))
          
            case .editNicknameAction(.didTapCancel):
                state.isEditNicknamePopupVisible = false
                return .send(.showEditNicknamePopup(false))
                
            default:
                return .none
            }
        }
    }
}
