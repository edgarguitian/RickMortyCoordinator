//
//  CharacterListViewModelTests.swift
//  RickMortyCoordinatorTests
//
//  Created by Edgar Guitian Rey on 19/4/25.
//

import Foundation
import Testing

@testable import RickMortyCoordinator

struct CharacterListViewModelTests {
    @Test
    @MainActor
    func test_loadCharacters() async throws {
        // GIVEN
        let getAllCharactersListUseCase = GetAllCharactersList(repository: MockCharactersRepository())
        let vm = CharacterListViewModel(
            charactersCoordinator: CharactersCoordinator(),
            getCharacterList: getAllCharactersListUseCase,
            errorMapper: RickAndMortyPresentableErrorMapper())
        
        // WHEN
        await vm.loadCharacters()
        
        // THEN
        #expect(vm.characters != nil)
    }
}
