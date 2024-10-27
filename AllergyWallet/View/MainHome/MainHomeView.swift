//
//  MainHomeView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/3/24.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct MainHomeView: View {
    
    let store: StoreOf<MainHomeFeature>
    
    var body: some View {
        
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            ZStack {
                
                VStack(alignment: .leading, spacing: 24) {
                    
                    MainTopView { viewStore.send(.navigationToSetting(viewStore.$users)) }
                        .padding(.horizontal, 24)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        LazyHStack(spacing: 0) {
                            
                            ForEach(0 ..< viewStore.users.count + 1) { index in
                                
                                ScrollView(.vertical, showsIndicators: false) {
                                    
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text("Safe Travels,")
                                            .font(.system(size: 28, weight: .semibold))
                                        
                                        if index >= viewStore.users.count {
                                            Text("New Account")
                                                .font(.system(size: 28, weight: .semibold))
                                                .foregroundColor(Color.primary500)
                                                .padding(.bottom, 16)
                                            
                                            CreateAccountView(didTapCreateAccount: {
                                                viewStore.send(.didTapCreateAccount)
                                            })
                                            .padding(.bottom, 48)
                                            
                                            createAllergyCardView()
                                            
                                        } else {
                                            let user = viewStore.users[index]
                                            
                                            Text(user.name)
                                                .font(.system(size: 28, weight: .semibold))
                                                .foregroundColor(Color.primary500)
                                                .padding(.bottom, 16)
                                            
                                            AllergyInfoView(allergies: .constant(user.allergries)) { _ in
                                                viewStore.send(.navigationToAllergyGuide(.myAllergyInfo(user)))
                                            }
                                            .padding(.bottom, 48)
                                            
                                            createAllergyCardView {
                                                viewStore.send(.navigationToAllergyGuide(.checkMenu(user)))
                                            } didTapRecommendMenu: {
                                                viewStore.send(.navigationToAllergyGuide(.recommendMenu(user)))
                                            } didTapReqeustAllergyFree: {
                                                viewStore.send(.navigationToAllergyGuide(.requestAllergenFree(user)))
                                            } didTapCrossContaminationCheck: {
                                                viewStore.send(.navigationToAllergyGuide(.checkCrossContamination(user)))
                                            } didTapEmergencySituation: {
                                                viewStore.send(.navigationToAllergyGuide(.emergencySituation(user)))
                                            }
                                        }
                                    }
                                    .padding(.horizontal, 24)
                                }
                                .frame(width: UIScreen.main.bounds.width)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
        }
    }
}

private extension MainHomeView {
    func createAllergyCardView(didTapCheckMenu: (() -> Void)? = nil,
                               didTapRecommendMenu: (() -> Void)? = nil,
                               didTapReqeustAllergyFree: (() -> Void)? = nil,
                               didTapCrossContaminationCheck: (() -> Void)? = nil,
                               didTapEmergencySituation: (() -> Void)? = nil) -> some View {
        return ZStack {
            CheckMenuForAllergyView(didTapButton: didTapCheckMenu)
                .offset(x: 0, y: 0)
                .zIndex(0)
            
            RecommendMenuView(didTapButton: didTapRecommendMenu)
                .offset(x: 0, y: 60)
                .zIndex(1)
            
            AllergenFreeRequestView(didTapButton: didTapReqeustAllergyFree)
                .offset(x: 0, y: 120)
                .zIndex(2)
            
            CrossContaminationCheckView(didTapButton: didTapCrossContaminationCheck)
                .offset(x: 0, y: 180)
                .zIndex(3)
            
            EmergencySituationView(didTapButton: didTapEmergencySituation)
                .offset(x: 0, y: 240)
                .zIndex(4)
        }
    }
}
