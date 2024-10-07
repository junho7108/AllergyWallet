//
//  AllergySymptomsView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/7/24.
//

import SwiftUI

struct AllergySymptomsState: Equatable {
    
}

struct AllergySymptomsView: View {
    
    @Binding var language: LanguageType
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(red: 1, green: 0.91, blue: 0.91))
            
            VStack(alignment: .leading) {
                
                Text(makeTitle(language: language))
                    .font(.system(size: 14))
                    .foregroundColor(.gray700)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 4)
                
                Text(makeTitle2(language: language))
                    .font(.system(size: 14))
                    .padding(.horizontal, 16)
                    .foregroundColor(.gray700)
                
              
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(.white)
                        .frame(maxWidth: .infinity, maxHeight: 292)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text(language == .eng ? "Skin and mucous membranes" : "피부 및 점막")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.semanticError)
                                .multilineTextAlignment(.leading)
                              
                            Text(language == .eng
                                 ? "itching, hives, swelling, redness, throat tightness, hoarseness"
                                 : "가려움증, 두드러기 , 부종, 발적, 목조임, 목쉼")
                                .font(.system(size: 14))
                                .foregroundColor(.gray700)
                                .multilineTextAlignment(.leading)
                        }
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text(language == .eng ? "Respiratory" : "호흡기")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.semanticError)
                                .multilineTextAlignment(.leading)
                              
                            Text(language == .eng
                                 ? "shortness of breath, coughing, wheezing, difficulty breathing"
                                 : "숨참, 기침, 천명음, 호흡 곤란")
                                .font(.system(size: 14))
                                .foregroundColor(.gray700)
                                .multilineTextAlignment(.leading)
                        }
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text(language == .eng ? "Cardiovascular" : "심혈관")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.semanticError)
                                .multilineTextAlignment(.leading)
                              
                            Text(language == .eng
                                 ? "dizziness, cold sweat, blurred vision, weak pulse"
                                 : "어지러움, 식은땀, 눈앞이 캄캄, 맥박이 약함")
                                .font(.system(size: 14))
                                .foregroundColor(.gray700)
                                .multilineTextAlignment(.leading)
                        }
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text(language == .eng ? "Gastrointestinal" : "위장")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.semanticError)
                                .multilineTextAlignment(.leading)
                              
                            Text(language == .eng
                                 ? "nausea, vomiting, abdominal pain, diarrhea"
                                 : "오심, 구토, 복통, 설사")
                                .font(.system(size: 14))
                                .foregroundColor(.gray700)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .padding(16)
                }
            }
            
            .padding(.vertical, 16)
        }
        .frame(maxWidth: .infinity)
        .defaultShadow()
    }
}

private extension AllergySymptomsView {
    func makeTitle(language: LanguageType) -> String {
        switch language {
        case .eng:
            return "∙ I may have a severe allergy shock (anaphylaxis)"
        case .kor:
            return "∙ 저는 현재 알레르기 쇼크(아나필락시스) 상태일 수 있어요."
        }
    }
    
    func makeTitle2(language: LanguageType) -> String {
        switch language {
        case .eng:
            return "∙ If 2 or more of the 4 symptoms below are present, epinephrine injection is needed at my thigh, or please call 119."
        case .kor:
            return "∙ 아래 4가지의 증상 중 2개 이상이 나타나면 제 허벅지에 에피네프린 주사를 놓아주시거나, 119에 전화해 주세요."
        }
    }
}
