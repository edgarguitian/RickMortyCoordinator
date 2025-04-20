//
//  CharactersCoordinator.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 16/4/25.
//

import SwiftUI

enum CharactersDestination: Equatable {
    case character(id: String)
}

@Observable
final class CharactersCoordinator {
    var path: [CharactersSteps] = []
    
    func goBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func navigateToCharacter(id: String) {
        path.append(.goCharacter(id: id))
    }
    
    
    func destination(for step: CharactersSteps) -> CharactersDestination {
        switch step {
        case .goCharacter(let id):
            return .character(id: id)
        }
    }
}

// MARK: - Coordinator
extension CharactersCoordinator: Coordinator {
    @ViewBuilder
    func redirect(_ step: CharactersSteps) -> some View {
        switch destination(for: step) {
        case .character(let id):
            CharacterDetailFactory().create(characterId: id, charactersCoordinator: self)
                .navigationBarBackButtonHidden()
        }
    }
}
