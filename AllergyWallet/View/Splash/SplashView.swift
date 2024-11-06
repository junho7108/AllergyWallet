//
//  SplashView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/5/24.
//

import SwiftUI
import ComposableArchitecture

struct SplashView: View {
    
    let store: StoreOf<SplashFeature>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                Spacer()
                
                LottieView(animationName: "Splash")
                
                Spacer()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    viewStore.send(.fetchUser)
                }
            }
        }
    }
}
