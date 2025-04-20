//
//  GetAllCharactersList.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

struct GetAllCharactersList: GetAllCharactersListType {
    private let repository: any AllCharactersListRepositoryType
    
    init(repository: any AllCharactersListRepositoryType) {
        self.repository = repository
    }
    
    func execute(currentPage: Int) async throws -> CharacterResult {
        try await repository.getAllCharactersList(currentPage: currentPage)
    }
    
}
