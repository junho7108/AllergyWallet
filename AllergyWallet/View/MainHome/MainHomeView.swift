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
            
            let user = currentPage < viewStore.users.count ? viewStore.users[currentPage] : nil
            
            VStack(alignment: .leading, spacing: 0) {
                
                MainTopView { viewStore.send(.navigationToSetting(viewStore.$users)) }
                    .padding(.horizontal, 24)
                
                Color.clear
                    .frame(height: 24)
                
                ScrollView(.vertical, showsIndicators: false) {
            
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Safe Travels,")
                            .font(.system(size: 28, weight: .semibold))
              
                        Text(user?.name ?? "{Nickname}")
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundColor(Color.primary500)
                    }
                    .opacity(user == nil ? 0.4 : 1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 12)
                    
                    TabView(selection: $currentPage) {
                        ForEach(viewStore.users.indices, id: \.self) { index in
                            
                            let user = viewStore.users[index]
                            
                            AllergyInfoView(allergies: .constant(user.allergries)) { _ in
                                viewStore.send(.navigationToAllergyGuide(.myAllergyInfo(user)))
                            }
                            .padding(.horizontal, 24)
                            .tag(index)
                        }
                        
                        CreateAccountView(didTapCreateAccount: {
                            viewStore.send(.didTapCreateAccount)
                        })
                        .padding(.horizontal, 24)
                        .tag(viewStore.users.count + 1)
                    }
                    .frame(height: 248)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .padding(.bottom, 24)
                    
                    PagingIndicatorView(numberOfPages: viewStore.users.count + 1, currentPage: $currentPage)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 24)
                    
                    createAllergyCardView {
                        if let user { viewStore.send(.navigationToAllergyGuide(.checkMenu(user))) }
                    } didTapRecommendMenu: {
                        if let user { viewStore.send(.navigationToAllergyGuide(.recommendMenu(user))) }
                    } didTapReqeustAllergyFree: {
                        if let user { viewStore.send(.navigationToAllergyGuide(.requestAllergenFree(user))) }
                    } didTapCrossContaminationCheck: {
                        if let user { viewStore.send(.navigationToAllergyGuide(.checkCrossContamination(user))) }
                    } didTapEmergencySituation: {
                        if let user { viewStore.send(.navigationToAllergyGuide(.emergencySituation(user))) }
                    }
                    .opacity(user == nil ? 0.4 : 1)
                    .padding([.horizontal, .bottom], 24)
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
