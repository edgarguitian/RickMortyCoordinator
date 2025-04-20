//
//  SharedURLSession.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

struct SharedURLSession: URLSessionType {
    func data(for url: URLRequest) async throws -> (Data?, URLResponse?) {
        do {
            let config = URLSessionConfiguration.default
            config.waitsForConnectivity = true
            config.allowsCellularAccess = true
            config.timeoutIntervalForResource = 30

            let session = URLSession(configuration: config)

            let (data, response) = try await session.data(for: url)
            return (data, response)
        } catch {
            return (nil, nil)
        }
    }
}
