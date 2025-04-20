//
//  Steps.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

protocol Steps: Equatable, Hashable {}

enum CharactersSteps: Steps {
    case goCharacter(id: String)
}
