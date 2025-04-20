//
//  InfoDTO.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

struct InfoDTO: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?

    enum CodingKeys: String, CodingKey {
        case count, pages, next, prev
    }
}
