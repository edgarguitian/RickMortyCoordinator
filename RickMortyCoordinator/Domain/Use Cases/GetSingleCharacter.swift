//
//  GetSingleCharacter.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 16/4/25.
//

import Foundation

struct GetSingleCharacter: GetSingleCharacterType {
    private let repository: any SingleCharacterRepositoryType
    
    init(repository: any SingleCharacterRepositoryType) {
        self.repository = repository
    }
    
    func execute(characterId: String) async throws -> Character {
        try await repository.getSingleCharacter(characterId: characterId)
    }
}
