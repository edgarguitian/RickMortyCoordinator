//
//  URLSessionType.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

protocol URLSessionType: Sendable {
    func data(for url: URLRequest) async throws -> (Data?, URLResponse?)
}
