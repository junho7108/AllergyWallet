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
        VStack(alignment: .leading, spacing: 5) {
            
            // 드롭다운을 열고 닫는 버튼
            Button(action: {
                withAnimation {
                    isExpanded.toggle() // 버튼 클릭 시 드롭다운 열기/닫기
                }
            }) {
                HStack {
                    Text(category) // 선택된 옵션 표시
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down") // 아이콘 변경
                        .foregroundColor(.gray)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray200, lineWidth: 1)
                )
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
                .overlay {
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(Color.gray200, lineWidth: 1)
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
}
