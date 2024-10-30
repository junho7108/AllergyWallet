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
    private(set) var showDivider: Bool = true
    
    var textBinding: Binding<String>
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(.gray700)
            
            Spacer()
          
            TextField(placeholder, text: textBinding)
                .textFieldStyle(.plain)
                .onChange(of: textBinding.wrappedValue) { oldValue, newValue in
                    if newValue.count > maxCount {
                        textBinding.wrappedValue = String(newValue.prefix(maxCount))
                    }
                }
            
            Spacer()
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.gray200)
            
        }
        .frame(height: 75)
    
    }
}
