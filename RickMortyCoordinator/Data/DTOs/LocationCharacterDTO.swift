//
//  LocationCharacterDTO.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

struct LocationCharacterDTO: Codable {
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, url
    }
}
