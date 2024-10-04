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
                
                Text("\(viewStore.user.name)")
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(Color.primary500)
                
                AllergyInfoView()
                
                Spacer()
            }
        }
      
    }
}
