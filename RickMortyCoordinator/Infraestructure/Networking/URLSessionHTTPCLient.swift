//
//  URLSessionHTTPCLient.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation

struct URLSessionHTTPCLient: HTTPClient {
    private let session: URLSessionType
    private let requestMaker: URLSessionRequestMaker
    private let errorResolver: URLSessionErrorResolver

    init(
        session: URLSessionType = SharedURLSession(),
        requestMaker: URLSessionRequestMaker,
        errorResolver: URLSessionErrorResolver
    ) {
        self.session = session
        self.requestMaker = requestMaker
        self.errorResolver = errorResolver
    }

    func makeRequest(endpoint: Endpoint, baseUrl: String)
        async throws(HTTPClientError) -> Data
    {
        guard
            let url = requestMaker.urlRequest(
                endpoint: endpoint, baseUrl: baseUrl)
        else {
            throw HTTPClientError.badURL
        }

        do {
            let resultSession = try await session.data(for: url)
            guard let resultData = resultSession.0 else {
                throw HTTPClientError.badURL
            }
            let responseString = String(decoding: resultData, as: UTF8.self)

            guard let response = resultSession.1 as? HTTPURLResponse else {
                throw HTTPClientError.responseError
            }

            debug(request: url, response: (resultData, response))

            guard response.statusCode == 200 else {
                throw errorResolver.resolve(statusCode: response.statusCode)
            }

            return resultData

        } catch let error as HTTPClientError {
            throw error
        } catch {
            throw errorResolver.resolve(error: error)
        }
    }

    private func debug(request: URLRequest, response: (Data, URLResponse)) {
        #if DEBUG
            print(
                "###########################################################################"
            )
            if let httpResponse = response.1 as? HTTPURLResponse {
                print("\nSTATUS CODE:\n\(httpResponse.statusCode)\n")
            }
            if let headers = request.allHTTPHeaderFields {
                print("HEADERS:\n\(headers)\n")
            }
            if let method = request.httpMethod {
                print("METHOD:\n\(method)\n")
            }

            if let url = response.1.url {
                print(
                    "URL:\n\(url.absoluteString.replacingOccurrences(of: "?", with: ""))\n"
                )
            }

            if let bodyData = request.httpBody,
                let body = String(data: bodyData, encoding: .utf8)
            {
                print("BODY DATA:\n\(body)\n")
            }
            if let value = String(data: response.0, encoding: .utf8) {
                print("RESPONSE DATA:\n\(value)\n")
            }
            print(
                "###########################################################################"
            )
        #endif
    }
}
