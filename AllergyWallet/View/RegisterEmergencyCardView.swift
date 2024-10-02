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
                    }
                }
               
                Spacer()

                HStack {
                    Button(action: {
                        
                    }) {
                        Text("Skip")
                            .font(.system(size: 16))
                            .foregroundColor(Color(hex: "#00986A"))
                            .frame(width: 185, height: 51)
                            .background(.white)
                            .cornerRadius(12)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(hex: "#00986A"), lineWidth: 0.8)
                    )
                    
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Text("Save")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .frame(width: 185, height: 51)
                            .background(Color(hex: "#00986A"))
                            .cornerRadius(12)
                    }
                }
               
            }
            .padding([.leading, .trailing], 24)
        }
    }
}
