//
//  LanguageSelectButton.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/6/24.
//

import SwiftUI
import ComposableArchitecture

struct LanguageSelectButton: View {
    
    let store: StoreOf<LanguageFeature>
    
    var didChangeLanguage: ((LanguageType) -> Void)? = nil
   
    var body: some View {
        
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            ZStack {
                RoundedRectangle(cornerRadius: 26)
                    .fill(Color.primary500)
                
                HStack(spacing: 0) {
                    Button {
                        viewStore.send(.didChangeLanguage(.kor))
                        didChangeLanguage?(.kor)
                    } label: {
                        HStack {
                            Text("KOR")
                                .font(.system(size: 14))
                                .foregroundColor(viewStore.language == .kor
                                                 ? Color.primary500
                                                 : Color(hex: "#050B893"))
                        }
                        .frame(width: 44, height: 21)
                        .background(viewStore.language == .kor
                                    ? Color.white
                                    : Color.clear)
                        .padding(.horizontal, 8)
                        
                    }
                    .frame(width: 44, height: 21)
                    .cornerRadius(12)
                    
                    Button {
                        viewStore.send(.didChangeLanguage(.eng))
                        didChangeLanguage?(.eng)
                    } label: {
                        HStack {
                            Text("ENG")
                                .font(.system(size: 14))
                                .foregroundColor(viewStore.language == .eng
                                                 ? Color.primary500
                                                 : Color(hex: "#050B893"))
                        }
                        .frame(width: 44, height: 21)
                        .background(viewStore.language == .eng
                                    ? Color.white
                                    : Color.clear)
                        .padding(.horizontal, 8)
                    }
                    .frame(width: 44, height: 21)
                    .cornerRadius(12)
                  
                }
                .padding(2)
            }
            .frame(width: 88, height: 21)
        }
    }
}
