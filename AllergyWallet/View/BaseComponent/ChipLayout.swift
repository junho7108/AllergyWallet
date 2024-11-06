//
//  ChipLayout.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/27/24.
//

import Foundation
import SwiftUI

struct ChipLayout: Layout {
    var verticalSpacing: CGFloat
    var horizontalSpacing: CGFloat
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        var totalHeight: CGFloat = 0
        var currentRowWidth: CGFloat = 0
        var currentRowHeight: CGFloat = 0
        
        // 가로 너비에 맞추어 Chip을 배치할 위치를 계산
        for view in subviews {
            let viewSize = view.sizeThatFits(.unspecified)
            if currentRowWidth + viewSize.width > (proposal.width ?? .infinity) {
                totalHeight += currentRowHeight + verticalSpacing
                currentRowWidth = 0
                currentRowHeight = 0
            }
            
            currentRowWidth += viewSize.width + horizontalSpacing
            currentRowHeight = max(currentRowHeight, viewSize.height)
        }
        
        // 마지막 줄의 높이 추가
        totalHeight += currentRowHeight
        return CGSize(width: proposal.width ?? 0, height: totalHeight)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var currentX: CGFloat = bounds.minX
        var currentY: CGFloat = bounds.minY
        var maxHeightInRow: CGFloat = 0
        
        for view in subviews {
            let viewSize = view.sizeThatFits(.unspecified)
            
            if currentX + viewSize.width > bounds.maxX {
                currentX = bounds.minX
                currentY += maxHeightInRow + verticalSpacing
                maxHeightInRow = 0
            }
            
            view.place(at: CGPoint(x: currentX, y: currentY), anchor: .topLeading, proposal: .unspecified)
            currentX += viewSize.width + horizontalSpacing
            maxHeightInRow = max(maxHeightInRow, viewSize.height)
        }
    }
}

