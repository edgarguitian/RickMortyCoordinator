//
//  MockHTTPClient.swift
//  RickMortyCoordinatorTests
//
//  Created by Edgar Guitian Rey on 19/4/25.
//

import Foundation
@testable import RickMortyCoordinator

class MockHTTPClient: HTTPClient {
    enum MockResult {
        case success(Data)
        case failure(HTTPClientError)
    }
    
    var mockResult: MockResult = .success(Data())
    
    func makeRequest(endpoint: RickMortyCoordinator.Endpoint, baseUrl: String) async throws(RickMortyCoordinator.HTTPClientError) -> Data {
        switch mockResult {
        case .success(let data):
            return data
        case .failure(let error):
            throw RickMortyCoordinator.HTTPClientError.generic
        }
    }
    
    
}
