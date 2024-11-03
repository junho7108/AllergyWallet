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
    
    var enableDeleteAcctount: Bool = true
    
    var body: some View {
        
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.primary50)
                   
                VStack(alignment: .leading, spacing: 0) {
                  
                    Text(viewStore.user.name)
                        .font(.system(size: 16))
                        .foregroundColor(.primary500)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                       
                    ZStack {
                        
                        Rectangle()
                            .fill(.white)
                            .clipShape(RoundedCorner(corners: [.bottomLeft, .bottomRight], radius: 8))
                            .frame(maxWidth: .infinity)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            makeEditButton(title: "Edit Nickname") { viewStore.send(.didTapEditNickname(viewStore.user)) }
                            
                            makeEditButton(title: "Edit Allergy Selection") { viewStore.send(.didTapEditAllergySelection(viewStore.user)) }
                          
                            makeEditButton(title: "Edit Emergency Contact Info") { viewStore.send(.didTapEditEmergencyContactInfo(viewStore.user)) }
                            
                            if enableDeleteAcctount {
                                makeEditButton(title: "Delete Account") { viewStore.send(.didTapDeleteAccount(viewStore.user)) }
                            }
                        }
                        .padding(.top, 12)
                        .padding(.bottom, 16)
                        .padding(.horizontal, 16)
                    }
                }
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 4)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

private extension ProfileEditView {
    func makeEditButton(title: String, didSelect: @escaping (() -> Void)) -> some View {
        Button {
            didSelect()
        } label: {
            HStack(alignment: .center) {
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

struct RoundedCorner: Shape {
    var corners: UIRectCorner
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
