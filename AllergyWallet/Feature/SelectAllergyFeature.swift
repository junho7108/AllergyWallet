//
//  SelectAllergyFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import ComposableArchitecture
import Dependencies

@Reducer
struct SelectAllergyFeature {
    
    typealias AllegrySelectInfo = (allegry: Allergy, isSelected: Bool)
    
    
    struct State: Equatable {
        var user: User
        var selectedAllergies: Set<Allergy> = []
        var isEnabledButton: Bool = false
    }
    
    enum Action {
        case didSelectAllegry(AllegrySelectInfo)
        case navigationToRegisterCard(User)
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            
            switch action {
            case .didSelectAllegry(let selectedInfo):
                
                if selectedInfo.isSelected {
                    state.selectedAllergies.insert(selectedInfo.allegry)
                } else {
                    state.selectedAllergies.remove(selectedInfo.allegry)
                }
                
                state.user.allergries = state.selectedAllergies
                
                state.isEnabledButton = !state.selectedAllergies.isEmpty
                
                return .none
                
            case .navigationToRegisterCard(let user):
                print("🟢 선택된 알레르기 \(user.allergries)")
            }
            
            return .none
        }
    }
}

