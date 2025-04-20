//
//  AllCharactersListRepository.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

final class AllCharactersListRepository: AllCharactersListRepositoryType {
    private let apiDataSource: any APICharactersDataSourceType
    private let errorMapper: RickMortyDomainErrorMapper
    private let charactersResultMapper: CharactersResultMapper
    
    init(apiDataSource: any APICharactersDataSourceType,
         errorMapper: RickMortyDomainErrorMapper,
         charactersResultMapper: CharactersResultMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
        self.charactersResultMapper = charactersResultMapper
    }
    
    
    func getAllCharactersList(currentPage: Int) async throws(RickAndMortyDomainError) -> CharacterResult {
        do {
            let charactersResponse = try await apiDataSource.getCharactersList(currentPage: currentPage)            
            return charactersResultMapper.map(charactersResponse: charactersResponse)
        } catch {
            throw errorMapper.map(error: error)
        }
    }
    
    
}
