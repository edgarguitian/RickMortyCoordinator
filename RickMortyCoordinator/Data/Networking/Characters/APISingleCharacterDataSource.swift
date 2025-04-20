//
//  APISingleCharacterDataSource.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 16/4/25.
//

import Foundation

struct APISingleCharacterDataSource: APISingleCharacterDataSourceType {
    
    private let httpClient: HTTPClient

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getSingleCharacter(characterId: String) async throws(HTTPClientError) -> CharacterListDTO {
        let queryParameters: [String: Any] = [:]
        let body: [String: Any] = [:]
        let endpoint = Endpoint(path: "character/"+characterId,
                                queryParameters: queryParameters,
                                body: body,
                                method: .get)


        do {
            let result = try await httpClient.makeRequest(endpoint: endpoint, baseUrl: "https://rickandmortyapi.com/api/")
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let characterResult = try decoder.decode(CharacterListDTO.self, from: result)
                return characterResult
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
