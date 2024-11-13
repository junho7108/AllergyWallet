//
//  View+Extensions.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/6/24.
//

import Foundation
import SwiftUI
import Photos

extension View {
    
    func openAppSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func captureScreen(completion: @escaping (UIImage?) -> Void) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            completion(nil)
            return
        }
        
        let renderer = UIGraphicsImageRenderer(size: window.bounds.size)
        let image = renderer.image { context in
            window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
        }
        
        completion(image)
    }
    
    func saveImageToGallery(_ image: UIImage, completion: ((Bool) -> Void)? = nil) {

        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        let authorized = checkAuthorizationStatus()
        
        completion?(authorized)
    }
    
    func defaultShadow() -> some View {
        return self.shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
    }
    
    func transparentGradient(color: Color = .white, direction: GradientDirection = .topToBottom) -> some View {
        let startPoint: UnitPoint
        let endPoint: UnitPoint
        
        switch direction {
        case .topToBottom:
            startPoint = .top
            endPoint = .bottom
        case .bottomToTop:
            startPoint = .bottom
            endPoint = .top
        }
        
        return self
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: color.opacity(0), location: 0.00),
                        Gradient.Stop(color: color, location: 0.20),
                    ],
                    startPoint: startPoint,
                    endPoint: endPoint
                )
            )
    }
}

private extension View {
    func checkAuthorizationStatus() -> Bool {
        let status = PHPhotoLibrary.authorizationStatus(for: .addOnly)
        
        switch status {
        case .authorized, .limited:
            return true
     
        default:
            return false
        }
    }
}
