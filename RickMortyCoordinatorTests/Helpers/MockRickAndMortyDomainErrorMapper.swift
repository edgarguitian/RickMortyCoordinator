//
//  MockRickAndMortyDomainErrorMapper.swift
//  RickMortyCoordinatorTests
//
//  Created by Edgar Guitian Rey on 19/4/25.
//

import Foundation
@testable import RickMortyCoordinator

class MockRickAndMortyDomainErrorMapper: RickMortyDomainErrorMapper {
    override func map(error: HTTPClientError?) -> RickAndMortyDomainError {
        return .generic
    }
}
