//
//  EmergencyCardView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/7/24.
//

import SwiftUI
import ComposableArchitecture

struct EmergencyCardView: View {
    
    let store: StoreOf<EmergencyCardFeature>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                HStack {
                    LanguageSelectButton(store: store.scope(state: \.languageState, action: \.languageAction))
                    
                    Spacer()
                    
                    Button { viewStore.send(.didTapBackButton) } label: {
                        HStack {
                            Spacer()
                            Image("Icon_reduce")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                    }
                    .frame(width: 40, height: 40)
                }
                .frame(height: 65)
                
                ScrollView(.vertical, showsIndicators: false) {
                    Text(makeTitle(language: viewStore.languageState.language))
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundColor(.semanticError)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 24)
                    
                    AllergySymptomsView(language: .constant(viewStore.languageState.language))
                        .padding(.bottom, 48)
                    
                    AllergyListView(language: .constant(viewStore.languageState.language),
                                    allergies: .constant(viewStore.user.allergries))
                        .padding(.bottom, 48)
                    
                    if let _ = viewStore.user.emergencyCard {
                        EmergencyContactInfoView(language: .constant(viewStore.languageState.language),
                                                 user: .constant(viewStore.user))
                        
                    }
                   
                    Spacer()
                }
            }
            .padding(.horizontal, 24)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.white, Color(hex: "#FFE9E9")]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
        .statusBarHidden(true)
        .ignoresSafeArea(edges: .top)
    }
}

private extension EmergencyCardView {
    func makeTitle(language: LanguageType) -> String {
        switch language {
        case .eng: return "Please take emergency action."
        case .kor: return "응급처치가 필요합니다."
        }
    }
}