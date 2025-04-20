//
//  SingleCharacterRepository.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 16/4/25.
//

import Foundation

final class SingleCharacterRepository: SingleCharacterRepositoryType {
    private let apiDataSource: any APISingleCharacterDataSourceType
    private let errorMapper: RickMortyDomainErrorMapper
    private let singleCharacterResultMapper: SingleCharacterResultMapper

    init(
        apiDataSource: any APISingleCharacterDataSourceType,
        errorMapper: RickMortyDomainErrorMapper,
        singleCharacterResultMapper: SingleCharacterResultMapper
    ) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
        self.singleCharacterResultMapper = singleCharacterResultMapper
    }
    
    func getSingleCharacter(characterId: String) async throws(RickAndMortyDomainError) -> Character {
        do {
            let characterResponse = try await apiDataSource.getSingleCharacter(characterId: characterId)
            return singleCharacterResultMapper.map(characterResponse: characterResponse)

        } catch {
            throw errorMapper.map(error: error)
        }
    }
}
