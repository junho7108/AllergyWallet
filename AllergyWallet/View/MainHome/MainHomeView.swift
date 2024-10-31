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
   
    @State private var currentPage: Int = 0
    
    var body: some View {
        
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            ZStack {
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    MainTopView { viewStore.send(.navigationToSetting(viewStore.$users)) }
                        .padding(.horizontal, 24)
                    
                    
                    //                    PagingIndicatorView(numberOfPages: viewStore.users.count + 1, currentPage: $currentPage)
                    //                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    TabView(selection: $currentPage) {
                        //MARK: 기존 계정
                        ForEach(viewStore.users.indices, id: \.self) { index in
                            
                            let user = viewStore.users[index]
                            
                            ScrollView(.vertical, showsIndicators: false) {
                               
                                LazyVStack(alignment: .leading, spacing: 0) {
                                    Text("Safe Travels,")
                                        .font(.system(size: 28, weight: .semibold))
                                        .padding(.top, 24)
                                    
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
                                .padding(.bottom, 24)
                            }
                            .tag(index)
                            .padding(.horizontal, 24)
                        }
                        
                        //MARK: 계정 추가
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack(alignment: .leading, spacing: 0) {
                                
                                Text("Safe Travels,")
                                    .font(.system(size: 28, weight: .semibold))
                                    .padding(.top, 24)
                                
                                Text("New Account")
                                    .font(.system(size: 28, weight: .semibold))
                                    .foregroundColor(Color.primary500)
                                    .padding(.bottom, 16)
                                
                                CreateAccountView(didTapCreateAccount: {
                                    viewStore.send(.didTapCreateAccount)
                                })
                                .padding(.bottom, 48)
                                
                                createAllergyCardView()
                            }
                            .padding(.bottom, 24)
                        }
                        .opacity(0.4)
                        .padding(.horizontal, 24)
                        .tag(viewStore.users.count)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
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
        return VStack(alignment: .leading, spacing: -60) {
            CheckMenuForAllergyView(didTapButton: didTapCheckMenu)
                .zIndex(0)
            
            RecommendMenuView(didTapButton: didTapRecommendMenu)
                .zIndex(1)
            
            AllergenFreeRequestView(didTapButton: didTapReqeustAllergyFree)
                .zIndex(2)
            
            CrossContaminationCheckView(didTapButton: didTapCrossContaminationCheck)
                .zIndex(3)
            
            EmergencySituationView(didTapButton: didTapEmergencySituation)
                .zIndex(4)
        }
    }
}
