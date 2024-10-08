//
//  MainHomeView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/3/24.
//

import SwiftUI
import ComposableArchitecture

struct MainHomeView: View {
    
    let store: StoreOf<MainHomeFeature>

    var body: some View {
        
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            ZStack {
                
                VStack(alignment: .leading, spacing: 24) {
                    
                    MainTopView {
                        viewStore.send(.navigationToSetting(viewStore.user))
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Safe Travels,")
                                .font(.system(size: 28, weight: .semibold))
                            
                            Text(viewStore.user.name)
                                .font(.system(size: 28, weight: .semibold))
                                .foregroundColor(Color.primary500)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                     
                        AllergyInfoView(store: store)
                    }
            
                    ZStack {
                        CheckMenuForAllergyView(store: store, didTapButton: {
                            viewStore.send(.navigationToAllergyGuide(.checkMenu(viewStore.user)))
                        })
                        .offset(x: 0, y: 0)
                        .zIndex(0)
                        
                        RecommendMenuView(store: store, didTapButton: {
                            viewStore.send(.navigationToAllergyGuide(.recommendMenu(viewStore.user)))
                        })
                        .offset(x: 0, y: 60)
                        .zIndex(1)
                        
                        AllergenFreeRequestView(store: store, didTapButton: {
                            viewStore.send(.navigationToAllergyGuide(.requestAllergenFree(viewStore.user)))
                        })
                        .offset(x: 0, y: 120)
                        .zIndex(2)
                        
                        CrossContaminationCheckView(store: store, didTapButton: {
                            viewStore.send(.navigationToAllergyGuide(.checkCrossContamination(viewStore.user)))
                        })
                        .offset(x: 0, y: 180)
                        .zIndex(3)
                        
                        EmergencySituationView(store: store, didTapButton: {
                            if let _ = viewStore.user.emergencyCard {
                                viewStore.send(.navigationToAllergyGuide(.emergencySituation(viewStore.user)))
                            } else {
                                viewStore.send(.showEmergencyPopup(true))
                            }
                        })
                        .offset(x: 0, y: 240)
                        .zIndex(4)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 24)
                
                if viewStore.isPopupVisible {
                    PopupView(title: "Create Another Account",
                              description: "Would you like to create another user account?",
                              cancelText: "Cancel",
                              confirmText: "Create") {
                        viewStore.send(.showEmergencyPopup(false))
                    } confirm: {
                        viewStore.send(.navigationToCreateEmergencyCard(viewStore.user))
                    }
                } else {
                    
                }
            }
        }
    }
}
