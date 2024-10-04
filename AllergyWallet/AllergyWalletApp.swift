//
//  AllergyWalletApp.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct AllergyWalletApp: App {
    var body: some Scene {
        WindowGroup {
            CoordinatorView(store: StoreOf<Coordinator>(
                initialState: Coordinator.State(),
                reducer: { Coordinator() }))
        }
    }
}
