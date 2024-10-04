//
//  AllergyCheckBoxView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import SwiftUI

struct AllergyCheckBoxView: View {

    private(set) var allegry: Allergy
    
    @State private(set) var isSelected: Bool = false
    
    var didSelect: ((SelectAllergyFeature.AllegrySelectInfo) -> Void)
    
    var body: some View {
        
        HStack {
            Text(allegry.text)
                .foregroundColor(.gray900)
                .font(.system(size: 18))
                .padding(.leading, 16)
            
            Spacer()
            
            Button {
                isSelected.toggle()
                didSelect((allegry, isSelected))
            } label: {
                Image(isSelected ? "Checkbox_fill" : "Checkbox")
                    .resizable()
                    .scaledToFit()
                    .padding(16)
            }
            .frame(width: 56, height: 56)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray200, lineWidth: 0.8)
                        .frame(maxWidth: .infinity)
        }
        .listRowSeparator(.hidden)
        .listRowInsets(EdgeInsets())
        .frame(height: 56)
       
    }
}

