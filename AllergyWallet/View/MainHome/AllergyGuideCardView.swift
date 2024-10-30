//
//  AllergyGuideCardView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/6/24.
//

import SwiftUI
import ComposableArchitecture

struct AllergyGuideCardView: View {
    let store: StoreOf<AllergyGuideCardFeature>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            VStack(alignment: .center, spacing: 0) {
                
                HStack {
                    LanguageSelectButton(store: store.scope(state: \.languageState, action: \.languageAction))
                    
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
                  
                
                Text(makeTitle(guide: viewStore.type, language: viewStore.languageState.language))
                    .font(.system(size: 28, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 24)
                
                AllergyGridView(store: store.scope(state: \.grid, action: \.never),
                                language: Binding<LanguageType>(get: { viewStore.languageState.language },
                                                                set: { _ in }))
                  
                Spacer()
     
                VStack(spacing: 12) {
                    Button(action: {
                        viewStore.send(.didTapAllergenIncluded(false))
                    }) {
                        Text(makePositiveButtonTitle(guide: viewStore.type,
                                                     language: viewStore.languageState.language))
                        .font(.system(size: 16))
                        .foregroundColor(viewStore.hasAllergen == false
                                         ? Color.white
                                         : Color.primary500)
                        .frame(maxWidth: .infinity, maxHeight: 51)
                        .background(viewStore.hasAllergen == false
                                    ? Color.primary500
                                    : Color.white)
                        .cornerRadius(12)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.primary500, lineWidth: 0.8)
                    )
                    
                    
                    Button(action: {
                        viewStore.send(.didTapAllergenIncluded(true))
                    }) {
                        Text(makeNegativeButtonTitle(guide: viewStore.type,
                                                     language: viewStore.languageState.language))
                        .font(.system(size: 16))
                        .foregroundColor(viewStore.hasAllergen == true
                                         ? Color.white
                                         : Color.primary500)
                        .frame(maxWidth: .infinity, maxHeight: 51)
                        .background(viewStore.hasAllergen == true
                                    ? Color.primary500
                                    : Color.white)
                        .cornerRadius(12)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.primary500, lineWidth: 0.8)
                    )
                }
            }
            .padding([.horizontal, .bottom], 24)
            .background(makeBackgroundColor(guid: viewStore.type))
        }
        .statusBarHidden(true)
        .ignoresSafeArea(edges: .top)
    }
}

private extension AllergyGuideCardView {
    func makeBackgroundColor(guid: AllergyGuideType) -> Color {
        switch guid {
        case .checkMenu, .requestAllergenFree:
            return .primary50
        case .recommendMenu, .checkCrossContamination:
            return .gray50
            
        default: return .white
        }
    }
    
    func makeTitle(guide: AllergyGuideType, language: LanguageType) -> String {
        switch language {
        case .eng:
            switch guide {
            case .checkMenu:
                return "I have food allergies. Does this menu contain any of the following ingredients?"
            case .recommendMenu:
                return "I have food allergies. Can you recommend a menu that doesn’t contain ingredients below?"
            case .requestAllergenFree:
                return "I have food allergies. Can the menu be prepared without ingredients below?"
            case .checkCrossContamination:
                return "I have food allergies. Can the food be cooked without cross contamination?"
            
            default: return ""
            }
            
        case .kor:
            switch guide {
            case .checkMenu:
                return "저는 식품 알레르기가 있습니다. 이 메뉴에 아래의 식품이 포함되어 있나요?"
            case .recommendMenu:
                return "저는 식품 알레르기가 있습니다. 아래의 식품이 포함되지 않은 메뉴를 추천해 주시겠어요?"
            case .requestAllergenFree:
                return "저는 식품 알레르기가 있습니다. 메뉴에서 알레르기 성분을 제외하고 조리가 가능한가요?"
            case .checkCrossContamination:
                return "저는 식품 알레르기가 있습니다. 해당 성분이 접촉되지 않도록 조리가 가능한가요?"
                
            default: return ""
            }
        }
    }
    
    func makePositiveButtonTitle(guide: AllergyGuideType, language: LanguageType) -> String {
        switch language {
        case .eng:
            switch guide {
            case .checkMenu:
                return "No, this menu is safe to eat 😊"
            case .recommendMenu:
                return "Certainly, I’ll help you 😊"
            case .requestAllergenFree:
                return "Yes! It’s possible 😊"
            case .checkCrossContamination:
                return "Yes! It’s possible 😊"
            
            default: return ""
            }
            
        case .kor:
            switch guide {
            case .checkMenu:
                return "포함되어 있지 않아요. 안심하고 드셔도 됩니다! 😊"
            case .recommendMenu:
                return "네 도와드릴게요. 😊"
            case .requestAllergenFree:
                return "네 가능합니다. 😊"
            case .checkCrossContamination:
                return "네 가능합니다. 😊"
                
            default: return ""
            }
        }
    }
    
    func makeNegativeButtonTitle(guide: AllergyGuideType, language: LanguageType) -> String {
        switch language {
        case .eng:
            switch guide {
            case .checkMenu:
                return "Yes, it contains ingredients above 🥲"
            case .recommendMenu:
                return "Every menu uses the ingredient above 🥲"
            case .requestAllergenFree:
                return "I’m unfraid it’s not possible 🥲"
            case .checkCrossContamination:
                return "I’m unfraid it’s not possible 🥲"
            
            default: return ""
            }
            
        case .kor:
            switch guide {
            case .checkMenu:
                return "네, 위의 식품이 들어있습니다. 🥲"
            case .recommendMenu:
                return "저희 식당에는 위의 식품을 모두 사용 중입니다. 🥲"
            case .requestAllergenFree:
                return "그렇게는 힘들 것 같아요. 🥲"
            case .checkCrossContamination:
                return "그렇게는 힘들 것 같아요. 🥲"
                
            default: return ""
            }
        }
    }
}
