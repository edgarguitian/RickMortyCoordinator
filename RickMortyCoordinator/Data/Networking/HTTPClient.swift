//
//  HTTPClient.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

protocol HTTPClient: Sendable {
    func makeRequest(endpoint: Endpoint, baseUrl: String) async throws(HTTPClientError) -> Data
}
