//
//  GetAllCharactersListTests.swift
//  RickMortyCoordinatorTests
//
//  Created by Edgar Guitian Rey on 19/4/25.
//

import Testing
@testable import RickMortyCoordinator

struct GetAllCharactersListTests {
    
    @Test
    func test_execute_sucesfully_returns_character_list_result() async throws {
        // GIVEN
        let mockInfoCharacterResult = InfoResult(count: 1, pages: 2, next: "testNext", prev: "testPrev")
        let mockLocationCharacter = LocationCharacter(name: "testLocationName", url: "testLocationUrl")
        let mockEpisodesCharacter = [
            "testEpisodeCharacterURL"
        ]
        
        let mockCharacters = [
        Character(id: 1, name: "testName", status: "testStatus", species: "testSpecies", type: "testType", gender: "testGender", origin: mockLocationCharacter, location: mockLocationCharacter, image: "testImage", episode: mockEpisodesCharacter, url: "testUrl", created: "testCreated")
        ]
        let mockCharacter = CharacterResult(info: mockInfoCharacterResult, result: mockCharacters)
        let stub = AllCharactersListRepositoryStub(result: mockCharacter)
        let sut = GetAllCharactersList(repository: stub)
        
        // WHEN
        let capturedAllCharactesList = try await sut.execute(currentPage: -1)
        
        // THEN
        #expect(capturedAllCharactesList.result.count == mockCharacters.count)
        #expect(capturedAllCharactesList.info.count == 1)
        #expect(capturedAllCharactesList.info.pages == 2)
        #expect(capturedAllCharactesList.info.next == "testNext")
        #expect(capturedAllCharactesList.info.prev == "testPrev")
        #expect(capturedAllCharactesList.result.first!.id == 1)
        #expect(capturedAllCharactesList.result.first!.name == "testName")
        #expect(capturedAllCharactesList.result.first!.status == "testStatus")
        #expect(capturedAllCharactesList.result.first!.species == "testSpecies")
        #expect(capturedAllCharactesList.result.first!.type == "testType")
        #expect(capturedAllCharactesList.result.first!.gender == "testGender")
        #expect(capturedAllCharactesList.result.first!.origin.name == "testLocationName")
        #expect(capturedAllCharactesList.result.first!.origin.url == "testLocationUrl")
        #expect(capturedAllCharactesList.result.first!.location.name == "testLocationName")
        #expect(capturedAllCharactesList.result.first!.location.url == "testLocationUrl")
        #expect(capturedAllCharactesList.result.first!.image == "testImage")
        #expect(capturedAllCharactesList.result.first!.episode.first == "testEpisodeCharacterURL")
        #expect(capturedAllCharactesList.result.first!.url == "testUrl")
        #expect(capturedAllCharactesList.result.first!.created == "testCreated")
    }
    
    @Test
    func test_execute_failure_when_repository_fails() async throws {
        // GIVEN
        let stub = AllCharactersListRepositoryStub(result: nil)
        let sut = GetAllCharactersList(repository: stub)
        
        // WHEN & THEN        
        await #expect(throws: (any Error).self) {
            try await sut.execute(currentPage: -1)
        }
    }
}
