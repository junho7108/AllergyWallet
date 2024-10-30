//
//  RegisterEmergencyCardView.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/2/24.
//

import SwiftUI
import ComposableArchitecture

struct RegisterEmergencyCardView: View {
    
    let store: StoreOf<RegisterEmergencyCardFeature>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading) {
                        
                        Text("Input Information for Your Emergency Card")
                            .font(.system(size: 28, weight: .semibold))
                            .padding(.bottom, 12)
                          
                        Text("in case of emergency, provide your information along with your allergy details.")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.gray700)
                            .padding(.bottom, 48)
                        
                        InputTextField(title: "First Name",
                                       placeholder: "FirstName",
                                       textBinding: Binding<String>(
                                        get: { viewStore.firstName ?? "" },
                                        set: { viewStore.send(.didChangeFirstName($0)) }
                                       ))
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 24)
                        
                        InputTextField(title: "Last Name",
                                       placeholder: "Last Name",
                                       textBinding: Binding<String>(
                                        get: { viewStore.lastName ?? "" },
                                        set: { viewStore.send(.didChangeLastName($0)) }
                                       ))
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 24)
                        
                        InputTextField(title: "Birth Data",
                                       placeholder: "YYYY.MM.DD",
                                       textBinding: Binding<String>(
                                        get: { viewStore.birthDate ?? "" },
                                        set: { viewStore.send(.didChangeBirthDate($0)) }
                                       ))
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 24)
                        
                        InputTextField(title: "Nationality",
                                       placeholder: "Nationality",
                                       textBinding: Binding<String>(
                                        get: { viewStore.nationality ?? "" },
                                        set: { viewStore.send(.didChangeNationality($0)) }
                                       ))
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 24)
                        
                        InputTextField(title: "Emergency Contact",
                                       placeholder: "Emergency Contact",
                                       textBinding: Binding<String>(
                                        get: { viewStore.emergencyContact ?? "" },
                                        set: { viewStore.send(.didChangeEmergencyContact($0)) }
                                       ))
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 24)
                        
                        InputTextField(title: "Korean Contact",
                                       placeholder: "Korean Contact",
                                       textBinding: Binding<String>(
                                        get: { viewStore.koreanContact ?? "" },
                                        set: { viewStore.send(.didChangeKoreanContact($0)) }
                                       ))
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 24)
                    }
                }
               
                Spacer()

                HStack(spacing: 12) {
                    Button(action: {
                        viewStore.send(.didTapSkip)
                    }) {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.primary500, lineWidth: 0.8)
                            .overlay {
                                Text("Skip")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color.primary500)
                                    .background(.white)
                            }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 51)

                    Button(action: {
                        viewStore.send(.didTapRegisterEmergencyCard)
                    }) {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.primary500)
                            .overlay {
                                Text("Create")
                                    .font(.system(size: 16))
                                    .foregroundColor(.white)
                                    .background(Color.primary500)
                            }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 51)
                }
            }
            .padding(24)
        }
    }
}
