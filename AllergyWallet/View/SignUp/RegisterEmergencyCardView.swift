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
    
    enum TextFieldType: Int, CaseIterable {
        case firstName, lastName, birthDate, nationality, emergencyContact, koreanContact
    }
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            
            ZStack {
                
                ScrollViewReader { proxy in
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
                                           isEditing: Binding<Bool>(
                                            get: { if case .firstname = viewStore.editState { return true }
                                                else { return false }},
                                            set: { _ in }),
                                           textBinding: Binding<String>(
                                            get: { viewStore.firstName ?? "" },
                                            set: { viewStore.send(.editInfo(.firstname($0))) }
                                           )) {
                                               withAnimation {
                                                   proxy.scrollTo(TextFieldType.firstName.rawValue, anchor: .topLeading)
                                               }
                                           }
                            .id(TextFieldType.firstName.rawValue)
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 24)
                           
                            InputTextField(title: "Last Name",
                                           placeholder: "Last Name",
                                           isEditing: Binding<Bool>(
                                            get: { if case .lastname = viewStore.editState {
                                                return true }
                                                else { return false }},
                                            set: { _ in }),
                                           textBinding: Binding<String>(
                                            get: { viewStore.lastName ?? "" },
                                            set: { viewStore.send(.editInfo(.lastname($0))) }
                                           )) {
                                               withAnimation {
                                                   proxy.scrollTo(TextFieldType.lastName.rawValue, anchor: .topLeading)
                                               }
                                        }
                            .id(TextFieldType.lastName.rawValue)
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 24)
                          
                            InputTextField(title: "Birth Date",
                                           placeholder: "YYYY.MM.DD",
                                           isEditing: Binding<Bool>(
                                            get: { if case .birthDate = viewStore.editState { return true }
                                                else { return false }},
                                            set: { _ in }),
                                           textBinding: Binding<String>(
                                            get: { viewStore.birthDate ?? "" },
                                            set: { viewStore.send(.editInfo(.birthDate($0))) }
                                           )) {
                                               withAnimation {
                                                   proxy.scrollTo(TextFieldType.birthDate.rawValue, anchor: .topLeading)
                                               }
                                           }
                            .id(TextFieldType.birthDate.rawValue)
                            .keyboardType(.numberPad)
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 24)
                             
                            InputTextField(title: "Nationality",
                                           placeholder: "Nationality",
                                           isEditing: Binding<Bool>(
                                            get: { if case .nationality = viewStore.editState { return true }
                                                else { return false }},
                                            set: { _ in }),
                                           textBinding: Binding<String>(
                                            get: { viewStore.nationality ?? "" },
                                            set: { viewStore.send(.editInfo(.nationality($0))) }
                                           )) {
                                               withAnimation {
                                                   proxy.scrollTo(TextFieldType.nationality.rawValue, anchor: .topLeading)
                                               }
                                           }
                            .id(TextFieldType.nationality.rawValue)
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 24)
                         
                            InputTextField(title: "Emergency Contact",
                                           placeholder: "Emergency Contact",
                                           isEditing: Binding<Bool>(
                                            get: { if case .emergencyContact = viewStore.editState { return true }
                                                else { return false }},
                                            set: { _ in }),
                                           textBinding: Binding<String>(
                                            get: { viewStore.emergencyContact ?? "" },
                                            set: { viewStore.send(.editInfo(.emergencyContact($0))) }
                                           )) {
                                               withAnimation {
                                                   proxy.scrollTo(TextFieldType.emergencyContact.rawValue, anchor: .topLeading)
                                               }
                                           }
                            .id(TextFieldType.emergencyContact.rawValue)
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 24)
                          
                            InputTextField(title: "Korean Contact",
                                           placeholder: "Korean Contact",
                                           isEditing: Binding<Bool>(
                                            get: { if case .koreanContact = viewStore.editState { return true }
                                                else { return false }},
                                            set: { _ in }),
                                           textBinding: Binding<String>(
                                            get: { viewStore.koreanContact ?? "" },
                                            set: { viewStore.send(.editInfo(.koreanContact($0))) }
                                           )) {
                                               withAnimation {
                                                   proxy.scrollTo(TextFieldType.koreanContact.rawValue, anchor: .topLeading)
                                               }
                                           }
                            .id(TextFieldType.koreanContact.rawValue)
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 24)
                           
                            Spacer()
                                .frame(height: 160)
                        }
                    }
                }
                
                VStack {
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
                    .frame(height: 51 + 24 + 24)
                    .transparentGradient()
                }
            }
            .padding([.horizontal, .top], 24)
        }
    }
}
