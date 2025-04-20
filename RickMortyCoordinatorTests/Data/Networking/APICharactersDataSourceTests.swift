//
//  APICharactersDataSourceTests.swift
//  RickMortyCoordinatorTests
//
//  Created by Edgar Guitian Rey on 19/4/25.
//

import Testing
@testable import RickMortyCoordinator
import Foundation

struct APICharactersDataSourceTests {
    @Test
    func test_getCharactersList_success() async {
        // GIVEN
        let mockHttpClient = MockHTTPClient()
        let apiCharactersDataSource = APICharactersDataSource(httpClient: mockHttpClient)
        let mockInfo = InfoDTO(count: 1, pages: 2, next: "testInfoNext", prev: "testInfoPrev")
        let mockLocationCharacter = LocationCharacterDTO(name: "testNameLocation", url: "testURLLocation")
        let mockEpisodeCharacter = ["testEpisodeCharacter"]
        
        let mockCharactersListDTO = [
        CharacterListDTO(id: 1, name: "testCharacterName", status: "testCharacterStatus", species: "testCharacterSpecie", type: "testCharacterType", gender: "testCharacterGender", origin: mockLocationCharacter, location: mockLocationCharacter, image: "testCharacterImage", episode: mockEpisodeCharacter, url: "testCharacterURL", created: "testCharacterCreated")
        ]
        
        let mockData = [ CharacterResponseDTO(info: mockInfo, results: mockCharactersListDTO) ]
        
        
        await #expect {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(mockData)
            
            mockHttpClient.mockResult = .success(jsonData)
            let listCharacters = try await apiCharactersDataSource.getCharactersList(currentPage: -1)
            #expect(listCharacters.results.count == 1)
            #expect(listCharacters.results.first!.id == 1)
            #expect(listCharacters.results.first!.name == "testCharacterName")
            #expect(listCharacters.results.first!.status == "testCharacterStatus")
            #expect(listCharacters.results.first!.species == "testCharacterSpecie")
            #expect(listCharacters.results.first!.type == "testCharacterType")
            #expect(listCharacters.results.first!.gender == "testCharacterGender")
            #expect(listCharacters.results.first!.origin.name == "testNameLocation")
            #expect(listCharacters.results.first!.origin.url == "testURLLocation")
            #expect(listCharacters.results.first!.location.name == "testNameLocation")
            #expect(listCharacters.results.first!.location.url == "testURLLocation")
            #expect(listCharacters.results.first!.image == "testCharacterImage")
            #expect(listCharacters.results.first!.episode.first == "testEpisodeCharacter")
            #expect(listCharacters.results.first!.url == "testCharacterURL")
            #expect(listCharacters.results.first!.created == "testCharacterCreated")
        } throws: { error in
            guard let apiError = error as? HTTPClientError else { return false }
            return apiError == .generic
        }
    }
}
