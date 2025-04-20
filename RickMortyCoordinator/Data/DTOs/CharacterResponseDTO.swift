//
//  CharacterResponseDTO.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

struct CharacterResponseDTO: Codable {
    let info: InfoDTO
    let results: [CharacterListDTO]

    enum CodingKeys: String, CodingKey {
        case info, results
    }
}
