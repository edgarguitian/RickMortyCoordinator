//
//  AllCharactersListRepositoryTests.swift
//  RickMortyCoordinatorTests
//
//  Created by Edgar Guitian Rey on 19/4/25.
//

import Testing

@testable import RickMortyCoordinator

struct AllCharactersListRepositoryTests {
    @Test
    func test_getAllCharactersList() async throws {
        // GIVEN
        let mockApiDataSource = MockApiCharactersDataSource()
        let mockErrorMapper = MockRickAndMortyDomainErrorMapper()
        let repository = AllCharactersListRepository(
            apiDataSource: mockApiDataSource, errorMapper: mockErrorMapper,
            charactersResultMapper: CharactersResultMapper())

        // WHEN & THEN

        await #expect {
            try await repository.getAllCharactersList(currentPage: -1)
        } throws: { error in
            guard let apiError = error as? RickAndMortyDomainError else {
                return false
            }
            return apiError == .generic
        }
    }
}
