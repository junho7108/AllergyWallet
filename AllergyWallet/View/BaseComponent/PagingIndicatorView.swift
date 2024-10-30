//
//  PagingIndicatorView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/29/24.
//

import Foundation
import SwiftUI

struct PagingIndicatorView: View {
    
    @State var numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack(spacing: 12) {
            
            Spacer()
            
            ForEach(0 ..< numberOfPages, id: \.self) { page in
                Circle()
                    .fill(page == currentPage ? Color.primary200 : Color(hex: "#D9D9D9"))
                    .frame(width: 8, height: 8)
            }
            
            Spacer()
        }
    }
}
