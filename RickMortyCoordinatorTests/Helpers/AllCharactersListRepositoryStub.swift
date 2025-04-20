//
//  AllCharactersListRepositoryStub.swift
//  RickMortyCoordinatorTests
//
//  Created by Edgar Guitian Rey on 19/4/25.
//

import Foundation
@testable import RickMortyCoordinator

struct AllCharactersListRepositoryStub: AllCharactersListRepositoryType {
    private let result: RickMortyCoordinator.CharacterResult?
    
    init(result: RickMortyCoordinator.CharacterResult?) {
        self.result = result
    }
    
    func getAllCharactersList(currentPage: Int) async throws(RickMortyCoordinator.RickAndMortyDomainError) -> RickMortyCoordinator.CharacterResult {
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
