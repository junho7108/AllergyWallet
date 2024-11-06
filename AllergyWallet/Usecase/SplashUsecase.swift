//
//  SplashUsecase.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/5/24.
//

import Dependencies

final class SplashUsecase {
    private let repository: AuthRepositoryType
    
    init(repository: AuthRepositoryType) {
        self.repository = repository
    }
    
    func fetchUser() async -> [User] {
        return await self.repository.fetchUser()
    }
}

extension SplashUsecase: DependencyKey {
    static var liveValue: SplashUsecase = SplashUsecase(repository: AuthRepository())
    static var testValue: SplashUsecase = SplashUsecase(repository: AuthRepositoryTest())
}

extension DependencyValues {
    var splashUsecase: SplashUsecase {
        get { self[SplashUsecase.self] }
        set { self[SplashUsecase.self] = newValue }
    }
}
