//
//  CharacterDetailViewModelTests.swift
//  RickMortyCoordinatorTests
//
//  Created by Edgar Guitian Rey on 19/4/25.
//

import Foundation
import Testing

@testable import RickMortyCoordinator

struct CharacterDetailViewModelTests {
    @Test
    @MainActor
    func test_loadCharacter() async throws {
        // GIVEN
        let getSingleCharacterUseCase = GetSingleCharacter(
            repository: MockSingleCharacterRepository())
        let vm = CharacterDetailViewModel(
            charactersCoordinator: CharactersCoordinator(),
            characterId: "1",
            getSingleCharacter: getSingleCharacterUseCase,
            errorMapper: RickAndMortyPresentableErrorMapper())

        // WHEN
        await vm.loadCharacter()

        // THEN
        #expect(vm.characterDetailInfo != nil)
    }
}
