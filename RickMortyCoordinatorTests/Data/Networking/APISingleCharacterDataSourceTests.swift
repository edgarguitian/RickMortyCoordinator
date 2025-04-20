//
//  APISingleCharacterDataSourceTests.swift
//  RickMortyCoordinatorTests
//
//  Created by Edgar Guitian Rey on 19/4/25.
//

import Testing
import Foundation
@testable import RickMortyCoordinator

struct APISingleCharacterDataSourceTests {
    @Test
    func test_getSingleCharacter_by_characterId_success() async {
        // GIVEN
        let mockHttpClient = MockHTTPClient()
        let apiCharactersDataSource = APISingleCharacterDataSource(httpClient: mockHttpClient)
        let mockInfo = InfoDTO(count: 1, pages: 2, next: "testInfoNext", prev: "testInfoPrev")
        let mockLocationCharacter = LocationCharacterDTO(name: "testNameLocation", url: "testURLLocation")
        let mockEpisodeCharacter = ["testEpisodeCharacter"]
        let mockCharacterListDTO = CharacterListDTO(id: 1, name: "testCharacterName", status: "testCharacterStatus", species: "testCharacterSpecie", type: "testCharacterType", gender: "testCharacterGender", origin: mockLocationCharacter, location: mockLocationCharacter, image: "testCharacterImage", episode: mockEpisodeCharacter, url: "testCharacterURL", created: "testCharacterCreated")
        
        await #expect {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(mockCharacterListDTO)
            
            mockHttpClient.mockResult = .success(jsonData)
            let singleCharacter = try await apiCharactersDataSource.getSingleCharacter(characterId: "1")
            #expect(singleCharacter.id == 1)
            #expect(singleCharacter.name == "testCharacterName")
            #expect(singleCharacter.status == "testCharacterStatus")
            #expect(singleCharacter.species == "testCharacterSpecie")
            #expect(singleCharacter.type == "testCharacterType")
            #expect(singleCharacter.gender == "testCharacterGender")
            #expect(singleCharacter.origin.name == "testNameLocation")
            #expect(singleCharacter.origin.url == "testURLLocation")
            #expect(singleCharacter.location.name == "testNameLocation")
            #expect(singleCharacter.location.url == "testURLLocation")
            #expect(singleCharacter.image == "testCharacterImage")
            #expect(singleCharacter.episode.first == "testEpisodeCharacter")
            #expect(singleCharacter.url == "testCharacterURL")
            #expect(singleCharacter.created == "testCharacterCreated")
        } throws: { error in
            guard let apiError = error as? HTTPClientError else { return false }
            return apiError == .generic
        }
    }
}
