//
//  GetAllCharactersListType.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation


protocol GetAllCharactersListType: Sendable {
   func execute(currentPage: Int) async throws -> CharacterResult
}
