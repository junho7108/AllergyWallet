//
//  SettingTopView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/8/24.
//

import SwiftUI

struct SettingTopView: View {
    
    var didTapBack: (() -> Void)
    
    var body: some View {
        HStack {
            
            Spacer()
                .frame(width: 32, height: 32)

            Spacer()
            
            Text("Settings")
                .font(.system(size: 18))
                .foregroundColor(.gray900)
            
            Spacer()
            
            Button {
                didTapBack()
            } label: {
                Image("Icon_close")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
            }
            .frame(width: 32, height: 32)
        }
        .frame(height: 48)
    }
}
