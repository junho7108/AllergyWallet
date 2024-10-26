//
//  EditSelectedAllergyFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/25/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct EditSelectedAllergyFeature {
    
    typealias AllegrySelectInfo = (allergy: Allergy, isSelected: Bool)
    
    @Dependency(\.allergiesUsecase) var usecase: AllergyUsecase
    
    struct State: Equatable {
        var user: User
        
        var originAllergies: [AllergyType] = []
        
        var selectedAllergies: [Allergy]
       
        init(user: User) {
            self.user = user
            self.selectedAllergies = user.allergries
        }
    }
    
    enum Action {
        case fetchData
        case fetchAllergies([AllergyType])
        case didTapBackButton
        
        case didSelectAllegry(AllegrySelectInfo)
        case editSelectedAllergy([Allergy])
        case didSaveAllergyChanges(User)
    }
    
  
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
                    if !state.selectedAllergies.contains(where: { $0.engName == selectedInfo.allergy.engName}) {
                        state.selectedAllergies.append(selectedInfo.allergy)
                    }
                } else {
                    state.selectedAllergies.removeAll(where: { $0.engName == selectedInfo.allergy.engName })
                }
                
                state.user.allergries = state.selectedAllergies
               
                return .none
                
            case .editSelectedAllergy(let allergies):
                state.user.allergries = allergies
                return .send(.didSaveAllergyChanges(state.user))
                
            default:
                return .none
            }
        }
    }
}
