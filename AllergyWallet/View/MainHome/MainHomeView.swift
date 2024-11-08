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
    
    private let maxUserCount: Int = 5
    
    var body: some View {
        
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            ZStack {
                
                let indicatorCount = viewStore.users.count < maxUserCount
                ? viewStore.users.count + 1
                : maxUserCount
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    MainTopView { viewStore.send(.navigationToSetting(viewStore.$users)) }
                        .padding(.horizontal, 24)
                    
                    Color.clear
                        .frame(height: 24)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Safe Travels,")
                                .font(.system(size: 28, weight: .semibold))
                            
                            Text(viewStore.currentUser?.name ?? "{Nickname}")
                                .font(.system(size: 28, weight: .semibold))
                                .foregroundColor(Color.primary500)
                        }
                        .opacity(viewStore.currentUser == nil ? 0.4 : 1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 24)
                        .padding(.bottom, 12)
                        
                        TabView(selection: Binding<Int>(get: { viewStore.currentPage },
                                                        set: { viewStore.send(.setCurrentPage($0))})) {
                            ForEach(viewStore.users.indices, id: \.self) { index in
                                
                                let user = viewStore.users[index]
                                
                                AllergyInfoView(allergies: .constant(user.allergries)) { _ in
                                    viewStore.send(.navigationToAllergyGuide(.myAllergyInfo(user)))
                                }
                                .padding(.horizontal, 24)
                                .tag(index)
                            }
                            
                            if viewStore.users.count < maxUserCount {
                                CreateAccountView(didTapCreateAccount: { viewStore.send(.didTapCreateAccount) })
                                    .padding(.horizontal, 24)
                                    .tag(viewStore.users.count)
                            }
                        }
                        .frame(height: 248)
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .padding(.bottom, 24)
                        
                        
                        PagingIndicatorView(numberOfPages: Binding<Int>(get: { indicatorCount }, set: { _ in }),
                                            currentPage: Binding<Int>(get: { viewStore.currentPage }, set: { _ in }))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 24)
                        
                        createAllergyCardView {
                            if let currentUser = viewStore.currentUser { viewStore.send(.navigationToAllergyGuide(.checkMenu(currentUser)))
                            }
                        } didTapRecommendMenu: {
                            if let currentUser = viewStore.currentUser { viewStore.send(.navigationToAllergyGuide(.recommendMenu(currentUser)))
                            }
                        } didTapReqeustAllergyFree: {
                            if let currentUser = viewStore.currentUser { viewStore.send(.navigationToAllergyGuide(.requestAllergenFree(currentUser)))
                            }
                        } didTapCrossContaminationCheck: {
                            if let currentUser = viewStore.currentUser { viewStore.send(.navigationToAllergyGuide(.checkCrossContamination(currentUser)))
                            }
                        } didTapEmergencySituation: {
                            if let currentUser = viewStore.currentUser { viewStore.send(.navigationToAllergyGuide(.emergencySituation(currentUser)))
                            }
                        }
                        .opacity(viewStore.currentUser == nil ? 0.4 : 1)
                        .padding([.horizontal, .bottom], 24)
                        .tabViewStyle(.page(indexDisplayMode: .never))
                    }
                }
                .onAppear {
                    viewStore.send(.setCurrentPage(viewStore.currentPage))
                }
                
                switch viewStore.popupState {
                case .addAccount:
                    AddAccountPopup {
                        viewStore.send(.closePopup)
                    } didTapCreate: {
                        viewStore.send(.navigationToSignUp)
                    }
                    
                case .none:
                    EmptyView()
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
