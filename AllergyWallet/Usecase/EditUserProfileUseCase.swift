//
//  EditUserProfileUseCase.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/16/24.
//

import Foundation
import Dependencies

final class EditUserProfileUseCase {
    private let repository: EditUserProfileRepositoryType
    
    init(repository: EditUserProfileRepositoryType) {
        self.repository = repository
    }
    
    func replaceUser(user: User) -> [User] {
        return repository.replaceUser(user: user)
    }
    
    func deleteUser(user: User) -> [User] {
        return repository.deleteUser(user: user)
    }
}

extension EditUserProfileUseCase: DependencyKey {
    static var liveValue: EditUserProfileUseCase = EditUserProfileUseCase(repository: EditUserProfileRepository())
}

extension DependencyValues {
    var editUserProfileUsecase: EditUserProfileUseCase {
        get { self[EditUserProfileUseCase.self] }
        set { self[EditUserProfileUseCase.self] = newValue }
    }
}
