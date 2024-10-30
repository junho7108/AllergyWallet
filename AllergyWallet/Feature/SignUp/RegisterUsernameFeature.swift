//
//  RegisterUsernameFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct RegisterUsernameFeature {
    
    struct State: Equatable {
        var username: String = ""
        var isValidNickname: Bool?
    }
    
    enum Action {
        case didChangeNickname(String)
        case createUser
        case navigateToSelectAllergies(User)
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            
            switch action {
            case .didChangeNickname(var text):
                state.username = text
                state.isValidNickname = text.isEmpty ? nil : isValidNickname(nickname: text)
                return .none
                
            case .createUser:
                guard isValidNickname(nickname: state.username) else { return .none }
                
                let user = User(name: state.username)
                return .send(.navigateToSelectAllergies(user))
                
            case .navigateToSelectAllergies:
                return .none
            }
        }
    }
}

private extension RegisterUsernameFeature {
    func isValidNickname(nickname: String) -> Bool {
        
        let pattern = "^(?=.*[a-zA-Z0-9])[-_a-zA-Z0-9]{1,20}$"
        
        let regex = try? NSRegularExpression(pattern: pattern)
        
        let range = NSRange(location: 0, length: nickname.utf16.count)
        
        return regex?.firstMatch(in: nickname, options: [], range: range) != nil
    }
}
