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
                    
                    MainTopView { viewStore.send(.navigationToSetting(viewStore.users)) }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        LazyHStack(spacing: 0) {
                            
                            ForEach(0 ..< viewStore.users.count + 1) { index in
                                
                                ScrollView(.vertical, showsIndicators: false) {
                                    
                                    if index >= viewStore.users.count {
                                        Spacer()
                                        
                                        Text("회원가입")
                                        
                                        Spacer()
                                    } else {
                                        let user = viewStore.users[index]
                              
                                        VStack(alignment: .leading, spacing: 0) {
                                            Text("Safe Travels,")
                                                .font(.system(size: 28, weight: .semibold))
                                            
                                            Text(user.name)
                                                .font(.system(size: 28, weight: .semibold))
                                                .foregroundColor(Color.primary500)
                                                .padding(.bottom, 16)
                                            
                                            AllergyInfoView(allergies: .constant(user.allergries))
                                                .padding(.bottom, 48)
                                            
                                            ZStack {
                                                CheckMenuForAllergyView(didTapButton: {
                                                    viewStore.send(.navigationToAllergyGuide(.checkMenu(user)))
                                                })
                                                .offset(x: 0, y: 0)
                                                .zIndex(0)
                                                
                                                RecommendMenuView(didTapButton: {
                                                    viewStore.send(.navigationToAllergyGuide(.recommendMenu(user)))
                                                })
                                                .offset(x: 0, y: 60)
                                                .zIndex(1)
                                                
                                                AllergenFreeRequestView(didTapButton: {
                                                    viewStore.send(.navigationToAllergyGuide(.requestAllergenFree(user)))
                                                })
                                                .offset(x: 0, y: 120)
                                                .zIndex(2)
                                                
                                                CrossContaminationCheckView(didTapButton: {
                                                    viewStore.send(.navigationToAllergyGuide(.checkCrossContamination(user)))
                                                })
                                                .offset(x: 0, y: 180)
                                                .zIndex(3)
                                                
                                                EmergencySituationView(didTapButton: {
                                                    viewStore.send(.navigationToAllergyGuide(.emergencySituation(user)))
                                                })
                                                .offset(x: 0, y: 240)
                                                .zIndex(4)
                                            }
                                            
                                            Spacer()
                                        }
                                    }
                                }
                                .frame(width: UIScreen.main.bounds.width - 48)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding(.horizontal, 24)
        }
        .background(.clear)
    }
}
