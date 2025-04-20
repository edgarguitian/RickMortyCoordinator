//
//  Endpoint.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

struct Endpoint {
    let path: String
    let queryParameters: [String: Any]
    let body: [String: Any]?
    let method: HTTPMethod
}
