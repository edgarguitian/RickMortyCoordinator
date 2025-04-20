//
//  SingleCharacterRepositoryType.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 16/4/25.
//

import Foundation

protocol SingleCharacterRepositoryType: Sendable{
    func getSingleCharacter(characterId: String) async throws(RickAndMortyDomainError) -> Character
}
