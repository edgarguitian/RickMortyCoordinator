//
//  CharactersCoordinatorTests.swift
//  RickMortyCoordinatorTests
//
//  Created by Edgar Guitian Rey on 20/4/25.
//

import Testing
@testable import RickMortyCoordinator

@Suite("CharactersCoodrinator Tests")
struct CharactersCoordinatorTests {
    
    @Test("navigateToCharacter() should append .goCharacter to path")
    func testNavigateToJoke() {
        let coordinator = CharactersCoordinator()
        coordinator.navigateToCharacter(id: "1")
        #expect(coordinator.path == [.goCharacter(id: "1")])
    }
    
    @Test("goBack() should do nothing if path is already empty")
    func testGoBackDoesNothingIfPathEmpty() {
        let coordinator = CharactersCoordinator()
        coordinator.goBack()
        #expect(coordinator.path == [])
    }
    
    @Test("goBack() should remove last step if path is not empty")
    func testGoBackRemovesLast() {
        let coordinator = CharactersCoordinator()
        coordinator.navigateToCharacter(id: "1")
        coordinator.goBack()
        #expect(coordinator.path == [])
    }
    
    @Test("goCharacter should return .character")
    func testGoCharacterDestination() {
        let coordinator = CharactersCoordinator()
        let result = coordinator.destination(for: .goCharacter(id: "1"))
        #expect(result == .character(id: "1"))
    }
}
