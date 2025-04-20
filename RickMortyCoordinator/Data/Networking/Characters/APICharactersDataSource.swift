//
//  APICharactersDataSource.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

struct APICharactersDataSource: APICharactersDataSourceType {
    private let httpClient: HTTPClient

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getCharactersList(currentPage: Int) async throws(HTTPClientError) -> CharacterResponseDTO {
        let queryParameters: [String: Any] = ["page": currentPage]
        let body: [String: Any] = [:]
        let endpoint = Endpoint(path: "character",
                                queryParameters: queryParameters,
                                body: body,
                                method: .get)


        do {
            let result = try await httpClient.makeRequest(endpoint: endpoint, baseUrl: "https://rickandmortyapi.com/api/")
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let charactersResult = try decoder.decode(CharacterResponseDTO.self, from: result)
                return charactersResult
            } catch {
                throw HTTPClientError.parsingError
            }
        } catch let error as HTTPClientError {
            throw error
        } catch {
            throw HTTPClientError.generic
        }
    }
    
    
}
