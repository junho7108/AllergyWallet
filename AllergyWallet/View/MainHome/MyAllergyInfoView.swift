//
//  CheckMenuForAllergyCardView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/5/24.
//

import SwiftUI
import ComposableArchitecture

struct MyAllergyInfoView: View {
    
    let store: StoreOf<AllergyGuideCardFeature>
    
    @State private var isFloating: Bool = false
    @State private var capturedImage: Image?
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            VStack(alignment: .center, spacing: 0) {
                
                HStack {
                    
                    LanguageSelectButton(store: store.scope(state: \.languageState, action: \.languageAction)) { _ in
                        captureScreen { image in
                            guard let image else { return }
                            capturedImage = Image(uiImage: image)
                        }
                    }
                    
                    Spacer()
                    
                    Button { viewStore.send(.didTapBackButton) } label: {
                        HStack {
                            Spacer()
                            Image("Icon_reduce")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                    }
                    .frame(width: 40, height: 40)
                }
                .frame(height: 65)
                .padding(.bottom, 6)
                  
                
                Text(viewStore.languageState.language == .eng
                     ? "I have food allergies to the following ingredients:"
                     : "아래의 식품에 심각한 알레르기 반응이 있습니다:")
                    .font(.system(size: 28, weight: .semibold))
                    .padding(.bottom, 24)
                
                AllergyGridView(store: store.scope(state: \.grid, action: \.never))
                    .padding(.bottom, 24)
                    
                Text(viewStore.languageState.language == .eng
                     ? "Immediate medical attention is required if I consume or come into contact with any foods or sauces containing this ingredient."
                     : "이 성분을 포함할 수 있는 모든 식품 및 소스들을 먹거나 만진 경우 즉각적인 의료 처치가 필요합니다.")
                    .font(.system(size: 14))
                    .foregroundColor(.gray700)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 8)
                
                Text(viewStore.languageState.language == .eng
                     ? "Allergic reactions may occur if food is prepared using gloves, utensils, or oil that has come into contact with this ingredient."
                     : "해당 성분이 접촉된 장갑, 조리도구, 기름 등으로 음식을 조리할 경우, 알레르기 반응이 발생할 수 있습니다.")
                    .font(.system(size: 14))
                    .foregroundColor(.gray700)
                    .frame(maxWidth: .infinity)
                
                Spacer()
                
                HStack(spacing: 8) {
                    Spacer()
                    
                    if isFloating {
                        Button {
                            captureScreen { image in
                                guard let image else { return }
                                capturedImage = Image(uiImage: image)
                                saveImageToGallery(image)
                            }
                        } label: {
                            Image("Button_download")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .scaledToFit()
                        }
                        
                        if let capturedImage {
                            ShareLink(item: capturedImage, preview: SharePreview("")) {
                                Image("Button_share")
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                    .scaledToFit()
                            }
                        }
                            
                        Button { isFloating = false } label: {
                            Image("Button_close")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .scaledToFit()
                        }
                    } else {
                        Button {
                            isFloating = true
                            captureScreen { image in
                                guard let image else { return }
                                capturedImage = Image(uiImage: image)
                            }
                        } label: {
                            Image("Button_floating")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .scaledToFit()
                        }
                    }
                }
            }
            .padding([.horizontal, .bottom], 24)
            .background(Color.primary50)
        }
        .statusBarHidden(true)
        .ignoresSafeArea(edges: .top)
        .frame(maxWidth: .infinity)
    }
}
