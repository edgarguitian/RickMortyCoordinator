//
//  CharacterListDTO.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

struct CharacterListDTO: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: LocationCharacterDTO
    let location: LocationCharacterDTO
    let image: String
    let episode: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name, status, species, type, gender, origin, location, image, episode, url, created
    }
}
