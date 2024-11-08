//
//  RegisterEmergencyCardFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct RegisterEmergencyCardFeature: DateFormatterProtocol {
    
    enum EditType: Equatable {
        case firstname(String)
        case lastname(String)
        case birthDate(String)
        case nationality(String)
        case emergencyContact(String)
        case koreanContact(String)
        
        case none
    }
    
    struct State: Equatable {
        var user: User
        
        var firstName: String?
        var lastName: String?
        var birthDate: String?
        var nationality: String?
        var emergencyContact: String?
        var koreanContact: String?
        
        var editState: EditType = .none
    }
    
    enum Action {
        case editInfo(EditType)
        
        case didTapSkip
        case didTapRegisterEmergencyCard
        
        case signUpUser(User)
        case navigationToHome([User])
    }
    
    @Dependency(\.signUpUsecase) var usecase: SignUpUsecase
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .editInfo(let type):
                switch type {
                case .firstname(let value):
                    state.editState = value.isEmpty ? .none : .firstname(value)
                    state.firstName = value
                    
                case .lastname(let value):
                    state.editState = value.isEmpty ? .none : .lastname(value)
                    state.lastName = value
                    
                case .birthDate(let value):
                    state.editState = value.isEmpty ? .none : .birthDate(value)
                    state.birthDate = formatDateInput(value, previousInput: state.birthDate ?? "")
                    
                case .nationality(let value):
                    state.editState = value.isEmpty ? .none : .nationality(value)
                    state.nationality = value
                    
                case .emergencyContact(let value):
                    state.editState = value.isEmpty ? .none : .emergencyContact(value)
                    state.emergencyContact = value
                    
                case .koreanContact(let value):
                    state.editState = value.isEmpty ? .none : .koreanContact(value)
                    state.koreanContact = value
                    
                default:
                    break
                }
                return .none
                
                
            case .didTapSkip:
                return .send(.signUpUser(state.user))
                
            case .navigationToHome:
                return .none
                
            case .didTapRegisterEmergencyCard:
                state.user.emergencyCard = EmergencyCard(firstName: state.firstName,
                                                         lastName: state.lastName,
                                                         birthDate: state.birthDate,
                                                         nationality: state.nationality,
                                                         emergencyContact: state.emergencyContact,
                                                         koreanContact: state.koreanContact)
                
                return .send(.signUpUser(state.user))
                
            case .signUpUser(let user):
                return .run { send in
                    let result = await usecase.signUpUser(user: user)
                    let users = await usecase.fetchUser()
                    await send(.navigationToHome(users))
                }
            }
        }
    }
}

