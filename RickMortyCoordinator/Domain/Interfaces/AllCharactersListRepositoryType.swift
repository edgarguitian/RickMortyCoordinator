//
//  AllCharactersListRepositoryType.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

protocol AllCharactersListRepositoryType: Sendable {
    func getAllCharactersList(currentPage: Int) async throws(RickAndMortyDomainError) -> CharacterResult
}
