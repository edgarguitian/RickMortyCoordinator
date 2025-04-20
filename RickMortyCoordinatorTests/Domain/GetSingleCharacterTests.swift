//
//  GetSingleCharacterTests.swift
//  RickMortyCoordinatorTests
//
//  Created by Edgar Guitian Rey on 19/4/25.
//

import Foundation
import Testing
@testable import RickMortyCoordinator

struct GetSingleCharacterTests {
    
    @Test
    func test_execute_characterId_sucesfully_returns_single_character() async throws {
        // GIVEN
        let mockLocationCharacter = LocationCharacter(name: "testLocationName", url: "testLocationUrl")
        let mockEpisodesCharacter = [
            "testEpisodeCharacterURL"
        ]

        let mockCharacter = Character(id: 1, name: "testName", status: "testStatus", species: "testSpecies", type: "testType", gender: "testGender", origin: mockLocationCharacter, location: mockLocationCharacter, image: "testImage", episode: mockEpisodesCharacter, url: "testUrl", created: "testCreated")
        let stub = SingleCharacterRepositoryStub(result: mockCharacter)
        let sut = GetSingleCharacter(repository: stub)
        
        // WHEN
        let capturedSingleCharacter = try await sut.execute(characterId: "1")

        // THEN
        #expect(capturedSingleCharacter.id == 1)
        #expect(capturedSingleCharacter.name == "testName")
        #expect(capturedSingleCharacter.status == "testStatus")
        #expect(capturedSingleCharacter.species == "testSpecies")
        #expect(capturedSingleCharacter.type == "testType")
        #expect(capturedSingleCharacter.gender == "testGender")
        #expect(capturedSingleCharacter.origin.name == "testLocationName")
        #expect(capturedSingleCharacter.origin.url == "testLocationUrl")
        #expect(capturedSingleCharacter.location.name == "testLocationName")
        #expect(capturedSingleCharacter.location.url == "testLocationUrl")
        #expect(capturedSingleCharacter.image == "testImage")
        #expect(capturedSingleCharacter.episode.first == "testEpisodeCharacterURL")
        #expect(capturedSingleCharacter.url == "testUrl")
        #expect(capturedSingleCharacter.created == "testCreated")
    }
    
    @Test
    func test_execute_failure_when_repository_fails() async throws {
        // GIVEN
        let stub = SingleCharacterRepositoryStub(result: nil)
        let sut = GetSingleCharacter(repository: stub)

        // WHEN & THEN
        await #expect(throws: (any Error).self) {
            try await sut.execute(characterId: "1")
        }
    }
    
}
