//
//  RegisterSelectAllergyFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import ComposableArchitecture
import Dependencies
import Foundation

@Reducer
struct RegisterSelectAllergyFeature {
    
    typealias AllegrySelectInfo = (allergy: Allergy, isSelected: Bool)
    
    struct State: Equatable {
        var user: User
        var allergyCategories: [AllergyCategory] = []
        var selectedAllergies: [Allergy] = []
        var isEnabledButton: Bool = false
    }
    
    enum Action {
        case fetchData
        case fetchAllergies([AllergyCategory])
        case didSelectAllegry(AllegrySelectInfo)
        case navigationToRegisterCard(User)
    }
    
    @Dependency(\.allergiesUsecase) var usecase: AllergyUsecase

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            
            switch action {
            case .fetchData:
                return .run { send in
                    let allergies = await usecase.fetchAllergies()
                    await send(.fetchAllergies(allergies))
                }
                
                
            case .fetchAllergies(let categories):
                state.allergyCategories = categories
                return .none
                
            case .didSelectAllegry(let selectedInfo):
            
                if selectedInfo.isSelected {
                    if !state.selectedAllergies.contains(where: { $0.engName == selectedInfo.allergy.engName}) {
                        state.selectedAllergies.append(selectedInfo.allergy)
                    }
                } else {
                    state.selectedAllergies.removeAll(where: { $0.engName == selectedInfo.allergy.engName })
                }
                
                state.user.allergries = state.selectedAllergies
                
                state.isEnabledButton = !state.selectedAllergies.isEmpty
                
                return .none
                
            case .navigationToRegisterCard(let user):
                return .none
            }
        }
    }
}

