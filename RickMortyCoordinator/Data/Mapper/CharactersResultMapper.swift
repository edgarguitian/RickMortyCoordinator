//
//  CharactersResultMapper.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

struct CharactersResultMapper {
    func map(charactersResponse: CharacterResponseDTO) -> CharacterResult {
        let charactersDomain = charactersResponse.results.map {
            Character(id: $0.id, name: $0.name, status: $0.status, species: $0.species,
                      type: $0.type, gender: $0.gender,
                      origin: LocationCharacter(name: $0.origin.name, url: $0.origin.url),
                      location: LocationCharacter(name: $0.location.name, url: $0.location.url),
                      image: $0.image, episode: $0.episode, url: $0.url, created: $0.created)
        }
        let infoResult = InfoResult(count: charactersResponse.info.count,
                                    pages: charactersResponse.info.pages,
                                    next: charactersResponse.info.next,
                                    prev: charactersResponse.info.prev)
        let charactersResultDomain = CharacterResult(info: infoResult,
                                                     result: charactersDomain)
        return charactersResultDomain
    }
}
