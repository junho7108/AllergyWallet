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
        var originAllergies: [AllergyType] = []
        var selectedAllergies: [Allergy] = []
        var isEnabledButton: Bool = false
    }
    
    enum Action {
        case fetchData
        case fetchAllergies([AllergyType])
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
                
                
            case .fetchAllergies(let allergies):
                state.originAllergies = allergies
                return .none
                
            case .didSelectAllegry(let selectedInfo):
            
                if selectedInfo.isSelected {
                    state.selectedAllergies.append(selectedInfo.allegry)
                } else {
                    if let firstIndex = state.selectedAllergies.firstIndex(where: { $0 == selectedInfo.allegry}) {
                        state.selectedAllergies.remove(at: firstIndex)
                    }
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

