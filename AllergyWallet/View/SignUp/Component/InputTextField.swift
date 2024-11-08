//
//  InputTextField.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import SwiftUI

struct InputTextField: View {
    
    private(set) var title: String
    private(set) var placeholder: String
    private(set) var maxCount: Int = 20
    
    @Binding var isEditing: Bool
    
    var textBinding: Binding<String>
    
    var didTapTextField: (() -> Void)? = nil
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(.gray700)
            
            TextField(placeholder, text: textBinding)
                .textFieldStyle(.plain)
                .onChange(of: textBinding.wrappedValue) { oldValue, newValue in
                    if newValue.count > maxCount {
                        textBinding.wrappedValue = String(newValue.prefix(maxCount))
                    }
                }
                .onTapGesture { didTapTextField?() }
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(isEditing ? Color.primary500 : Color.gray200)
            
        }
    }
}
