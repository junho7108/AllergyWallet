//
//  EmergencyContactInfoView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/7/24.
//

import SwiftUI

struct EmergencyContactInfoView: View {
    
    enum personalInfoType {
        case firstName(String?)
        case lastName(String?)
        case birthDate(String?)
        case nationality(String?)
        case emergencyContact(String?)
        case koreanContact(String?)
        
        func title(language: LanguageType) -> String {
            switch self {
            case .firstName: return language == .eng ? "First Name" : "이름"
            case .lastName: return language == .eng ? "Last Name" : "성"
            case .birthDate:  return language == .eng ? "Birth Date" : "생년월일"
            case .nationality: return language == .eng ? "Nationality" : "국적"
            case .emergencyContact: return language == .eng ? "Emergency Contact" : "응급 연락처"
            case .koreanContact: return language == .eng ? "Korean Contact" : "한국내 응급 연락처"
            }
        }
        
        var value: String? {
            switch self {
            case .firstName(let value),
                    .lastName(let value),
                    .birthDate(let value),
                    .nationality(let value),
                    .emergencyContact(let value),
                    .koreanContact(let value):
                return value
            }
        }
    }
    
    @Binding var language: LanguageType
    @Binding var user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text(language == .eng ? "Emergency Contact Info" : "응급 상황 개인 정보")
                .font(.system(size: 16))
                .foregroundColor(.gray900)
            
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.white)
                
                VStack(spacing: 24) {
                    personalInfoView(type: .firstName(user.emergencyCard?.firstName), language: language)
                    
                    personalInfoView(type: .lastName(user.emergencyCard?.lastName), language: language)
                    
                    personalInfoView(type: .birthDate(user.emergencyCard?.birthDate), language: language)
                    
                    personalInfoView(type: .nationality(user.emergencyCard?.nationality), language: language)
                    
                    personalInfoView(type: .emergencyContact(user.emergencyCard?.emergencyContact), language: language)
                    
                    personalInfoView(type: .koreanContact(user.emergencyCard?.koreanContact), language: language)
                }
                .padding(16)
                
            }
        }
        .frame(maxWidth: .infinity)
        .defaultShadow()
    }
}

private extension EmergencyContactInfoView {
  
    func personalInfoView(type: personalInfoType, language: LanguageType) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text(type.title(language: language))
                .font(.system(size: 14))
                .foregroundColor(.gray700)
            
            let text = if let text = type.value, !text.isEmpty { text }
                        else { "You can update info in the setting." }
            
            let textColor = if let text = type.value, !text.isEmpty { Color.gray900 }
                            else { Color.gray500 }
            
            Text(text)
                .font(.system(size: 18))
                .foregroundColor(textColor)
            
            Divider()
        }
    }
}
