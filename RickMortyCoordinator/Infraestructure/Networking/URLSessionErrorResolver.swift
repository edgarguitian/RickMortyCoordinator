//
//  URLSessionErrorResolver.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

struct URLSessionErrorResolver {
    func resolve(statusCode: Int) -> HTTPClientError {
        guard statusCode != 429 else {
            return .tooManyRequests
        }

        guard statusCode >= 500 else {
            return .clientError
        }

        return .serverError
    }

    func resolve(error: Error) -> HTTPClientError {
        return .generic
    }
}
