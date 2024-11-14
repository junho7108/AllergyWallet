//
//  AllergyPickerView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/4/24.
//

import SwiftUI

struct AllergyPickerView: View {
    @State var isExpanded = false
    
    @State var selectedAllergy: [Allergy] = []
    
    @State private var isAllSelected: Bool = false
    
    var category: String
    
    var allergies: [Allergy]
    
    var didSelect: ((EditSelectedAllergyFeature.AllegrySelectInfo) -> Void)

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Button(action: {
                isExpanded.toggle()
            }) {
                HStack {
                    Text(category)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
            }
            .overlay {
                if isExpanded {
                    Rectangle()
                        .fill(Color.clear)
                        .overlay(
                            RoundedCorner(corners: [.topLeft, .topRight], radius: 12)
                                .stroke(Color.gray200, lineWidth: 1)
                        )
                } else {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray200, lineWidth: 1)
                }
            }
            
            if isExpanded && allergies.count > 1 {

                VStack(alignment: .leading, spacing: 0) {
                    
                    Button {
                        isAllSelected.toggle()
                        
                        selectedAllergy = isAllSelected ? allergies : []
                       
                        allergies.forEach { allergy in
                            didSelect((allergy: allergy, isSelected: isAllSelected))
                        }
                        
                    } label: {
                        Text("Overall Selection")
                            .foregroundColor(.gray900)
                            .font(.system(size: 18))
                            .padding(.leading, 16)
                        
                        Spacer()
                        
                        Image(isAllSelected ? "Checkbox_fill" : "Checkbox")
                            .resizable()
                            .scaledToFit()
                            .padding(16)
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .frame(height: 56)
                    
                    ForEach(allergies) { allergy in
                        var isSelected: Bool = selectedAllergy.contains(where: { $0.engName == allergy.engName })
                        
                        AllergyCheckBoxView(allegry: allergy,
                                            isSelected: Binding<Bool>(get: { isSelected }, set: { isSelected = $0 }),
                                            style: .plain) { selectInfo in
                            
                            if selectInfo.isSelected {
                                selectedAllergy.append(selectInfo.allergy)
                            } else {
                                isAllSelected = false
                                selectedAllergy.removeAll(where: { $0.engName == allergy.engName })
                            }
                            
                            didSelect(selectInfo)
                        }
                    }
                }
                .background(.white)
                .overlay {
                    Rectangle()
                        .fill(Color.clear)
                        .overlay(
                            RoundedCorner(corners: [.bottomLeft, .bottomRight], radius: 12)
                                .stroke(Color.gray200, lineWidth: 1)
                        )
                }
            }
        }
    }
}
