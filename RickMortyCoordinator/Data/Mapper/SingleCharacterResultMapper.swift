//
//  SingleCharacterResultMapper.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 16/4/25.
//

import Foundation

struct SingleCharacterResultMapper {
    func map(characterResponse: CharacterListDTO) -> Character {
        let characterDomain = Character(id: characterResponse.id, name: characterResponse.name,
                                        status: characterResponse.status, species: characterResponse.species,
                                        type: characterResponse.type, gender: characterResponse.gender,
                                        origin: LocationCharacter(name: characterResponse.origin.name,
                                                                  url: characterResponse.origin.url),
                                        location: LocationCharacter(name: characterResponse.location.name,
                                                                    url: characterResponse.location.url),
                                        image: characterResponse.image, episode: characterResponse.episode,
                                        url: characterResponse.url, created: characterResponse.created)

        return characterDomain
    }
}
