//
//  EditUserProfileUseCase.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/16/24.
//

import Foundation
import Dependencies

final class EditUsereUseCase {
    private let repository: EditUserRepositoryProtocol
    
    init(repository: EditUserRepositoryProtocol) {
        self.repository = repository
    }
    
    func replaceUser(user: User) -> [User] {
        return repository.replaceUser(user: user)
    }
    
    func deleteUser(user: User) -> [User] {
        return repository.deleteUser(user: user)
    }
}

extension EditUsereUseCase: DependencyKey {
    static var liveValue: EditUsereUseCase = EditUsereUseCase(repository: EditUserRepository())
}

extension DependencyValues {
    var editUserProfileUsecase: EditUsereUseCase {
        get { self[EditUsereUseCase.self] }
        set { self[EditUsereUseCase.self] = newValue }
    }
}
