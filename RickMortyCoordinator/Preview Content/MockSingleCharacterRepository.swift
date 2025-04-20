//
//  MockSingleCharacterRepository.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 16/4/25.
//

import Foundation

final class MockSingleCharacterRepository: SingleCharacterRepositoryType {
    func getSingleCharacter(characterId: String) async throws(RickAndMortyDomainError) -> Character {
        Character(
            id: 0, name: "Test Name 1", status: "Test Status 1",
            species: "Test Species 1", type: "Test Type 1",
            gender: "Test Gender 1",
            origin: LocationCharacter(
                name: "Test Origin Name 1", url: "Test Origin URL 1"),
            location: LocationCharacter(
                name: "Test Location Name 1", url: "Test Location URL 1"
            ),
            image:
                "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            episode: ["Test Episode 1", "Test Episode 2"],
            url: "Test URL 1",
            created: "Test Created 1")
    }
    
    
}
