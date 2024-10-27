//
//  Screen.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import ComposableArchitecture

@Reducer(state: .equatable)
enum Screen {
    case splash(SplashFeature)
    case signUp(SignUpFeature)
    case selectAllergy(SelectAllergyFeature)
    case registerEmergencyCard(RegisterEmergencyCardFeature)
    case mainHome(MainHomeFeature)
    
    case myAllergyInfo(AllergyGuideCardFeature)
    case allergyGuideCard(AllergyGuideCardFeature)
    case emergencyCard(EmergencyCardFeature)
    
    case setting(SettingFeature)
    case editSelectedAllergy(EditSelectedAllergyFeature)
    case editEmergencyCard(EditEmergencyCardFeature)
}
