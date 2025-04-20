//
//  GetSingleCharacterType.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 16/4/25.
//

import Foundation

protocol GetSingleCharacterType: Sendable {
    func execute(characterId: String) async throws -> Character
}
