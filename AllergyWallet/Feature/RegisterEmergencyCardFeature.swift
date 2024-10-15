//
//  RegisterEmergencyCardFeature.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct RegisterEmergencyCardFeature {
    
    struct State: Equatable {
        var user: User
        
        var firstName: String?
        var lastName: String?
        var birthDate: String?
        var nationality: String?
        var emergencyContact: String?
        var koreanContact: String?
    }
    
    enum Action {
        case didChangeFirstName(String)
        case didChangeLastName(String)
        case didChangeBirthDate(String)
        case didChangeNationality(String)
        case didChangeEmergencyContact(String)
        case didChangeKoreanContact(String)
        case didTapSkip
        case didTapRegisterEmergencyCard
        
        case signUpUser(User)
        case navigationToHome([User])
    }
    
    @Dependency(\.signUpUsecase) var usecase: SignUpUsecase
    
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
                    await send(.navigationToHome([user]))
                }
            }
        }
    }
}

private extension RegisterEmergencyCardFeature {
    func formatDateInput(_ input: String) -> String {
        let digits = input.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        var formattedDate = ""
        
        if digits.count > 0 {
            let year = String(digits.prefix(4))
            formattedDate = year
        }
        
        if digits.count > 4 {
            let month = String(digits.prefix(6).suffix(2))
            formattedDate += ".\(month)"
        }
        
        if digits.count > 6 {
            let day = String(digits.prefix(8).suffix(2))
            formattedDate += ".\(day)"
        }
        
        return formattedDate
    }
    
    func validateDate(_ date: String) -> Bool {
        let dateRegex = #"^\d{4}\.\d{2}\.\d{2}$"#
        let datePredicate = NSPredicate(format:"SELF MATCHES %@", dateRegex)
        return datePredicate.evaluate(with: date)
    }
}
