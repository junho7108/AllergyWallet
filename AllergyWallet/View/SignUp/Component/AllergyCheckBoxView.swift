//
//  AllergyCheckBoxView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import SwiftUI

struct AllergyCheckBoxView: View {
    
    enum CheckBoxStyle {
        case round
        case plain
    }
    
    private(set) var allegry: Allergy
    
    @State private(set) var isSelected: Bool = false
    
    var style: CheckBoxStyle = .round
    
    var didSelect: ((SelectAllergyFeature.AllegrySelectInfo) -> Void)
    
    var body: some View {
        
        HStack {
            Button {
                isSelected.toggle()
                didSelect((allegry, isSelected))
            } label: {
                Text(allegry.engName)
                    .foregroundColor(.gray900)
                    .font(.system(size: 18))
                    .padding(.leading, 16)
                
                Spacer()
                
                Image(isSelected ? "Checkbox_fill" : "Checkbox")
                    .resizable()
                    .scaledToFit()
                    .padding(16)
            }
        }
        .overlay {
            if style == .round {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? Color.primary500 : Color.gray200, lineWidth: 1)
                    .frame(maxWidth: .infinity)
            }
        }
        .listRowSeparator(.hidden)
        .listRowInsets(EdgeInsets())
        .frame(height: 56)
        
    }
}

