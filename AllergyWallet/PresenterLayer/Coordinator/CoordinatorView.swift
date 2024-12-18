//
//  CoordinatorView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators
import SwiftUIIntrospect

struct CoordinatorView: View {
    let store: StoreOf<Coordinator>
    
    init(store: StoreOf<Coordinator>) {
        self.store = store
        setupNavigationBar()
    }
    
    var body: some View {
        TCARouter(store.scope(state: \.routes, action: \.router)) { screen in
            switch screen.case {
            case .splash(let store):
                SplashView(store: store)
                
            case .registerUsername(let store):
                RegisterUsernameView(store: store)
                
            case .registerSelectAllergy(let store):
                RegisterSelectAllergyView(store: store)
                
            case .registerEmergencyCard(let store):
                RegisterEmergencyCardView(store: store)
                
            case .mainHome(let store):
                MainHomeView(store: store)
                
            case .myAllergyInfo(let store):
                MyAllergyInfoView(store: store)
                
            case .allergyGuideCard(let store):
                AllergyGuideCardView(store: store)
                
            case .emergencyCard(let store):
                EmergencyCardView(store: store)
                
            case .setting(let store):
                SettingView(store: store)
                
            case .editSelectedAllergy(let store):
                EditSelectedAllergyView(store: store)
                
            case .editEmergencyCard(let store):
                EditEmergencyCardView(store: store)
            }
        }
    }
}

private extension CoordinatorView {
    func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        
        // 백버튼 색상
        let backImage = UIImage(named: "BackButton")?.withRenderingMode(.alwaysOriginal)
        appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
        appearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.backButtonAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -6)
        // 네비게이션 바 배경색
      
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.white
        
        appearance.shadowImage = UIImage()
        appearance.shadowColor = .clear
        
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor(color: .gray900) ?? .white,
            .font: UIFont.systemFont(ofSize: 18)
        ]

        // 네비게이션 바에 스타일 적용
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
}
