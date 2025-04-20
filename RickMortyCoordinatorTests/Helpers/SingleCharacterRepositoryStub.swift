//
//  SingleCharacterRepositoryStub.swift
//  RickMortyCoordinatorTests
//
//  Created by Edgar Guitian Rey on 19/4/25.
//

import Foundation
@testable import RickMortyCoordinator

struct SingleCharacterRepositoryStub: SingleCharacterRepositoryType {
    private let result: RickMortyCoordinator.Character?
    
    init(result: RickMortyCoordinator.Character?) {
        self.result = result
    }
    
    
    
    func getSingleCharacter(characterId: String) async throws(RickMortyCoordinator.RickAndMortyDomainError) -> RickMortyCoordinator.Character {
        do {
            if let result = self.result {
                return result
            } else {
                throw RickMortyCoordinator.RickAndMortyDomainError.generic
            }
        } catch {
            throw RickMortyCoordinator.RickAndMortyDomainError.generic
        }
    }
    
    
}
