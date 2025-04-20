//
//  HTTPClientError.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

enum HTTPClientError: Error {
    case clientError
    case serverError
    case generic
    case parsingError
    case badURL
    case responseError
    case tooManyRequests
}
