//
//  RickMortyDomainErrorMapper.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

class RickMortyDomainErrorMapper: @unchecked Sendable {
    func map(error: HTTPClientError?) -> RickAndMortyDomainError {
        switch error {
            
        case .clientError:
            return .generic
        case .serverError:
            return .generic
        case .generic:
            return .generic
        case .parsingError:
            return .generic
        case .badURL:
            return .generic
        case .responseError:
            return .generic
        case .tooManyRequests:
            return .tooManyRequests
        default:
            return .generic
        }
    }
}
