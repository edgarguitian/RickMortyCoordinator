//
//  MockApiSingleCharacterDataSource.swift
//  RickMortyCoordinatorTests
//
//  Created by Edgar Guitian Rey on 19/4/25.
//

import Foundation
@testable import RickMortyCoordinator

struct MockApiSingleCharacterDataSource: APISingleCharacterDataSourceType {
    func getSingleCharacter(characterId: String) async throws(RickMortyCoordinator.HTTPClientError) -> RickMortyCoordinator.CharacterListDTO {
        let mockInfo = InfoDTO(count: 1, pages: 2, next: "testInfoNext", prev: "testInfoPrev")
        let mockLocationCharacter = LocationCharacterDTO(name: "testNameLocation", url: "testURLLocation")
        let mockEpisodeCharacter = ["testEpisodeCharacter"]
        let mockSingleCharacterDTO = CharacterListDTO(id: 1, name: "testCharacterName", status: "testCharacterStatus", species: "testCharacterSpecie", type: "testCharacterType", gender: "testCharacterGender", origin: mockLocationCharacter, location: mockLocationCharacter, image: "testCharacterImage", episode: mockEpisodeCharacter, url: "testCharacterURL", created: "testCharacterCreated")
        
        return mockSingleCharacterDTO
    }
    
    
}
