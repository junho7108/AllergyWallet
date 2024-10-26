//
//  ProfileEditView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/8/24.
//

import SwiftUI
import ComposableArchitecture

struct ProfileEditView: View {
    
    let store: StoreOf<ProfileEditFeature>
    
    var body: some View {
        
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.primary50)
                    
                VStack(alignment: .leading) {
                  
                    Text(viewStore.user.name)
                        .font(.system(size: 16))
                        .foregroundColor(.primary500)
                        .padding(.horizontal, 16)
                       
                    ZStack {
                        
                        Rectangle()
                            .fill(.white)
                            .frame(maxWidth: .infinity)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            makeEditButton(title: "Edit Nickname") { viewStore.send(.didTapEditNickname) }
                            
                            makeEditButton(title: "Edit Allergy Selection") { viewStore.send(.didTapEditAllergySelection(viewStore.user)) }
                          
                            makeEditButton(title: "Edit Emergency Contact Info") { viewStore.send(.didTapEditEmergencyContactInfo) }
                            
                            makeEditButton(title: "Delete Account") { viewStore.send(.didTapDeleteAccount) }
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .padding(.vertical, 16)
            }
            .frame(maxWidth: .infinity, maxHeight: 256)
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 4)
            
        }
    }
}

private extension ProfileEditView {
    func makeEditButton(title: String, didSelect: @escaping (() -> Void)) -> some View {
        Button {
            didSelect()
        } label: {
            HStack {
                Text(title)
                    .font(.system(size: 16))
                    .foregroundColor(.gray700)
                
                Spacer()
                
                Image("Icon_arrow_right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
        }
        .frame(height: 42)
    }
}
