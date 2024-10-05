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
            VStack(alignment: .leading) {
                Text("Safe Travels,")
                    .font(.system(size: 28, weight: .semibold))
                
                Text(viewStore.user.name)
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(Color.primary500)
                
                AllergyInfoView(store: store)
                    .padding(.bottom, 16)
                
                ZStack {
                    CheckMenuForAllergyView(store: store, didTapButton: {
                        viewStore.send(.navigationToMenuOption(.checkMenu(viewStore.user)))
                    })
                    .offset(x: 0, y: 0)
                    .zIndex(0)
                    
                    RecommendMenuView(store: store, didTapButton: {
                        viewStore.send(.navigationToMenuOption(.recommendMenu(viewStore.user)))
                    })
                    .offset(x: 0, y: 60)
                    .zIndex(1)
                    
                    AllergenFreeRequestView(store: store, didTapButton: {
                        viewStore.send(.navigationToMenuOption(.requestAllergenFree(viewStore.user)))
                    })
                    .offset(x: 0, y: 120)
                    .zIndex(2)
                    
                    CrossContaminationCheckView(store: store, didTapButton: {
                        viewStore.send(.navigationToMenuOption(.checkCrossContamination(viewStore.user)))
                    })
                    .offset(x: 0, y: 180)
                    .zIndex(3)
                    
                    EmergencySituationView(store: store, didTapButton: {
                        viewStore.send(.navigationToMenuOption(.emergencySituation(viewStore.user)))
                    })
                    .offset(x: 0, y: 240)
                    .zIndex(4)
                    
                }
                
                Spacer()
            }
            .padding(.horizontal, 24)
        }
    }
}
