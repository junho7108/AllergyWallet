//
//  MainTopView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/8/24.
//

import SwiftUI

struct MainTopView: View {
    
    var didTapSetting: (() -> Void)
    
    var body: some View {
        
        HStack(alignment: .center) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 32)
            
            Spacer()
            
            Button {
                didTapSetting()
            } label: {
                Image("Icon_settings")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
            }
        }
        .frame(height: 48)
    }
}
