//
//  RickMortyDomainErrorMapperTests.swift
//  RickMortyCoordinatorTests
//
//  Created by Edgar Guitian Rey on 19/4/25.
//

import Testing
@testable import RickMortyCoordinator

struct RickMortyDomainErrorMapperTests {
    @Test
    func test_map_clientError() {
        #expect(RickMortyDomainErrorMapper().map(error: HTTPClientError.clientError) == RickAndMortyDomainError.generic)
    }
    
    @Test
    func test_map_serverError() {
        #expect(RickMortyDomainErrorMapper().map(error: HTTPClientError.serverError) == RickAndMortyDomainError.generic)
    }
    
    @Test
    func test_map_generic() {
        #expect(RickMortyDomainErrorMapper().map(error: HTTPClientError.generic) == RickAndMortyDomainError.generic)
    }
    
    @Test
    func test_map_parsingError() {
        #expect(RickMortyDomainErrorMapper().map(error: HTTPClientError.parsingError) == RickAndMortyDomainError.generic)
    }
    
    @Test
    func test_map_badURL() {
        #expect(RickMortyDomainErrorMapper().map(error: HTTPClientError.badURL) == RickAndMortyDomainError.generic)
    }
    
    @Test
    func test_map_responseError() {
        #expect(RickMortyDomainErrorMapper().map(error: HTTPClientError.responseError) == RickAndMortyDomainError.generic)
    }
    
    @Test
    func test_map_tooManyRequests() {
        #expect(RickMortyDomainErrorMapper().map(error: HTTPClientError.tooManyRequests) == RickAndMortyDomainError.tooManyRequests)
    }
}
