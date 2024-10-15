//
//  EmergencyContactInfoView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/7/24.
//

import SwiftUI

struct EmergencyContactInfoView: View {
    
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
                    if let firstName = user.emergencyCard?.firstName {
                        personalInfoView(title: language == .eng ? "First Name" : "이름",
                                         value: firstName)
                    }
                   
                    if let lastName = user.emergencyCard?.lastName {
                        personalInfoView(title: language == .eng ? "Last Name" : "성",
                                         value: lastName)
                    }
                    
                    if let birthDate = user.emergencyCard?.birthDate {
                        personalInfoView(title: language == .eng ? "Birth Date" : "생년월일",
                                         value: birthDate)
                    }
                   
                    if let nationality = user.emergencyCard?.nationality {
                        personalInfoView(title: language == .eng ? "Nationality" : "국적",
                                         value: nationality)
                    }
                    
                    if let emergencyContact = user.emergencyCard?.emergencyContact {
                        personalInfoView(title: language == .eng ? "Emergency contack" : "응급 연락처",
                                         value: emergencyContact)
                    }
                    
                    if let koreanContact = user.emergencyCard?.koreanContact {
                        personalInfoView(title: language == .eng ? "Korean contact" : "한국내 응급 연락처",
                                         value: koreanContact)
                    }
                }
                .padding(16)
                
            }
        }
        .frame(maxWidth: .infinity)
        .defaultShadow()
    }
}

private extension EmergencyContactInfoView {
    func personalInfoView(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(.gray700)
            
            Text(value)
                .font(.system(size: 18))
                .foregroundColor(.gray900)
            
            Divider()
        }
    }
}
