//
//  MockCharactersRepository.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

final class MockCharactersRepository: AllCharactersListRepositoryType {
    func getAllCharactersList(currentPage: Int)
        async throws(RickAndMortyDomainError) -> CharacterResult
    {
        return CharacterResult(
            info: InfoResult(count: 2, pages: 2, next: nil, prev: nil),
            result: [
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
                    created: "Test Created 1"),
                Character(
                    id: 1, name: "Test Name 2", status: "Test Status 2",
                    species: "Test Species 2", type: "Test Type 2",
                    gender: "Test Gender 2",
                    origin: LocationCharacter(
                        name: "Test Origin Name 2", url: "Test Origin URL 2"),
                    location: LocationCharacter(
                        name: "Test Location Name 2", url: "Test Location URL 2"
                    ),
                    image:
                        "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
                    episode: ["Test Episode 1", "Test Episode 2"],
                    url: "Test URL 2",
                    created: "Test Created 2"),
            ])
    }

}
