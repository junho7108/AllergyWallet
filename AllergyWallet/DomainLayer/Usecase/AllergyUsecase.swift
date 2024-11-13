//
//  AllergyUsecase.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/4/24.
//

import Foundation
import Dependencies

final class AllergyUsecase {
    private let repository: AllergyRepositoryProtocol
    
    init(repository: AllergyRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchAllergies() async -> [AllergyCategory] {
        return await repository.fetchAllergies()
    }
}

extension AllergyUsecase: DependencyKey {
    static var liveValue: AllergyUsecase = AllergyUsecase(repository: AllergyRepository())
}

extension DependencyValues {
    var allergiesUsecase: AllergyUsecase {
        get { self[AllergyUsecase.self] }
        set { self[AllergyUsecase.self] = newValue }
    }
}
