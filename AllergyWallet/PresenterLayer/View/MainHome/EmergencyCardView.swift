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
                        .padding(.leading, 24)
                    
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
                    .padding(.trailing, 24)
                }
                .frame(height: 65)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: .white, location: 0.80),
                            Gradient.Stop(color: .white.opacity(0), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0.46, y: 0),
                        endPoint: UnitPoint(x: 0.45, y: 1)
                    )
                )
               
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        Text(makeTitle(language: viewStore.languageState.language))
                            .font(.system(size: 28, weight: .semibold))
                            .lineHeight(103, fontSize: 28)
                            .foregroundColor(.semanticError)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.horizontal, 24)
                           
                        VStack(alignment: .leading, spacing: 48) {
                            AllergySymptomsView(language: .constant(viewStore.languageState.language))
                               
                            AllergyListView(language: .constant(viewStore.languageState.language),
                                            allergies: .constant(viewStore.user.allergries))
                               
                            EmergencyContactInfoView(language: .constant(viewStore.languageState.language),
                                                     user: .constant(viewStore.user))
                        }
                        .padding(.horizontal, 24)
                    }
                    .padding(.bottom, 24)
                }
            }
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: .white, location: 0.00),
                        Gradient.Stop(color: Color(red: 0.99, green: 0.92, blue: 0.92), location: 0.47),
                        Gradient.Stop(color: Color(red: 0.96, green: 0.75, blue: 0.75), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0.06),
                    endPoint: UnitPoint(x: 0.5, y: 1)
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
