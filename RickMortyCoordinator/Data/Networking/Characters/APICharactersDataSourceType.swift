//
//  APICharactersDataSourceType.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

protocol APICharactersDataSourceType: Sendable {
    func getCharactersList(currentPage: Int) async throws(HTTPClientError) -> CharacterResponseDTO
}
