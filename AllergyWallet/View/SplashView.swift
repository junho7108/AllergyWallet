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
                Text("Splash")
            }
            .onAppear {
                viewStore.send(.fetchUser)
            }
        }
    }
}
