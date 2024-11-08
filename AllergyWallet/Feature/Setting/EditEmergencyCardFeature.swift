//
//  EditEmergencyCardFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/27/24.
//

import ComposableArchitecture

@Reducer
struct EditEmergencyCardFeature: DateFormatterProtocol {
    
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
        
        init(user: User) {
            self.user = user
            self.firstName = user.emergencyCard?.firstName
            self.lastName = user.emergencyCard?.lastName
            self.birthDate = user.emergencyCard?.birthDate
            self.nationality = user.emergencyCard?.nationality
            self.emergencyContact = user.emergencyCard?.emergencyContact
            self.koreanContact = user.emergencyCard?.koreanContact
        }
    }
    
    enum Action {
        case editInfo(EditType)
        
        case didTapCancel
        case didTapEditEmergencyCard
        
        case didSaveEmergencyChanges(User)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .editInfo(let type):
                switch type {
                case .firstname(let value):
                    state.editState = .firstname(value)
                    state.firstName = value
                    
                case .lastname(let value):
                    state.editState = .lastname(value)
                    state.lastName = value
                    
                case .birthDate(let value):
                    state.editState = .birthDate(value)
                    state.birthDate = formatDateInput(value, previousInput: state.birthDate ?? "")
                    
                case .nationality(let value):
                    state.editState = .nationality(value)
                    state.nationality = value
                    
                case .emergencyContact(let value):
                    state.editState = .emergencyContact(value)
                    state.emergencyContact = value
                    
                case .koreanContact(let value):
                    state.editState = .koreanContact(value)
                    state.koreanContact = value
                    
                default:
                    break
                }
                return .none
                
            case .didTapEditEmergencyCard:
                let card = EmergencyCard(firstName: state.firstName,
                              lastName: state.lastName,
                              birthDate: state.birthDate,
                              nationality: state.nationality,
                              emergencyContact: state.emergencyContact,
                              koreanContact: state.koreanContact)
                
                state.user.emergencyCard = card
                return .send(.didSaveEmergencyChanges(state.user))
                
            default:
                return .none
            }
        }
    }
}
