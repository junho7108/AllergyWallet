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
            
            Text(language == .eng ? "Allergy Information" : "알레르기 정보")
                .font(.system(size: 16))
                .foregroundColor(.gray900)
            
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.white)
                
                VStack(spacing: 24) {
                    
                    personalInfoView(title: language == .eng ? "First Name" : "이름",
                                     value: user.emergencyCard!.firstName)
                   
                    personalInfoView(title: language == .eng ? "Last Name" : "성",
                                     value: user.emergencyCard!.lastName)
                    
                    personalInfoView(title: language == .eng ? "Birth Date" : "생년월일",
                                     value: user.emergencyCard!.birthDate)
                    
                    personalInfoView(title: language == .eng ? "Nationality" : "국적",
                                     value: user.emergencyCard!.nationality)
                    
                    personalInfoView(title: language == .eng ? "Emergency contack" : "응급 연락처",
                                     value: user.emergencyCard!.emergencyContact)
                    
                    personalInfoView(title: language == .eng ? "Korean contact" : "한국내 응급 연락처",
                                     value: user.emergencyCard!.koreanContact)

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