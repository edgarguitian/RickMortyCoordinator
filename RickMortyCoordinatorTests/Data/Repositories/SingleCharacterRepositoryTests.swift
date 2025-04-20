//
//  SingleCharacterRepositoryTests.swift
//  RickMortyCoordinatorTests
//
//  Created by Edgar Guitian Rey on 19/4/25.
//

import Testing
@testable import RickMortyCoordinator

struct SingleCharacterRepositoryTests {
    @Test
    func test_getSingleCharacter_by_characterId_success() async {
        let mockApiDataSource = MockApiSingleCharacterDataSource()
        let mockErrorMapper = MockRickAndMortyDomainErrorMapper()
        let repository = SingleCharacterRepository(apiDataSource: mockApiDataSource, errorMapper: mockErrorMapper, singleCharacterResultMapper: SingleCharacterResultMapper())
        
        await #expect {
            try await repository.getSingleCharacter(characterId: "1")
        } throws: { error in
            guard let apiError = error as? RickAndMortyDomainError else { return false }
            return apiError == .generic
        }
    }
}
