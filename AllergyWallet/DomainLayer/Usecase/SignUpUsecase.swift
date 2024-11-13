//
//  SignUpUsecase.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/5/24.
//

import Dependencies

final class SignUpUsecase {
    private let repository: AuthRepositoryProtocol
    
    init(repository: AuthRepositoryProtocol) {
        self.repository = repository
    }
    
    func signUpUser(user: User) async -> Bool {
        return await self.repository.signUpUser(user: user)
    }
    
    func fetchUser() async -> [User] {
        return await self.repository.fetchUser()
    }
}

extension SignUpUsecase: DependencyKey {
    static var liveValue: SignUpUsecase = SignUpUsecase(repository: AuthRepository())
    static var testValue: SignUpUsecase = SignUpUsecase(repository: AuthRepositoryTest())
}

extension DependencyValues {
    var signUpUsecase: SignUpUsecase {
        get { self[SignUpUsecase.self] }
        set { self[SignUpUsecase.self] = newValue }
    }
}
