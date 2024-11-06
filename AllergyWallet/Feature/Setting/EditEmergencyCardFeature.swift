//
//  EditEmergencyCardFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/27/24.
//

import ComposableArchitecture

@Reducer
struct EditEmergencyCardFeature: DateFormatterProtocol {
    
    struct State: Equatable {
        var user: User
        
        var firstName: String?
        var lastName: String?
        var birthDate: String?
        var nationality: String?
        var emergencyContact: String?
        var koreanContact: String?
        
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
        case didChangeFirstName(String)
        case didChangeLastName(String)
        case didChangeBirthDate(String)
        case didChangeNationality(String)
        case didChangeEmergencyContact(String)
        case didChangeKoreanContact(String)
        
        case didTapCancel
        case didTapEditEmergencyCard
        
        case didSaveEmergencyChanges(User)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .didChangeFirstName(let firstName):
                state.firstName = firstName
                return .none
                
            case .didChangeLastName(let lastName):
                state.lastName = lastName
                return .none
                
            case .didChangeBirthDate(let birthDate):
                state.birthDate = formatDateInput(birthDate)
                return .none
                
            case .didChangeNationality(let nationality):
                state.nationality = nationality
                return .none
                
            case .didChangeEmergencyContact(let emergencyContact):
                state.emergencyContact = emergencyContact
                return .none
                
            case .didChangeKoreanContact(let koreanContact):
                state.koreanContact = koreanContact
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
