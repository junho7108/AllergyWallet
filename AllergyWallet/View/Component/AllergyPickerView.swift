//
//  AllergyPickerView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/4/24.
//

import SwiftUI

struct AllergyPickerView: View {
    @State private var isExpanded = false
    
    @State var category: String
    
    var allergies: [Allergy]
    
    var didSelect: ((SelectAllergyFeature.AllegrySelectInfo) -> Void)

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
                    ForEach(allergies) { allergy in
                        
                        AllergyCheckBoxView(allegry: allergy, style: .plain) { selectInfo in
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
