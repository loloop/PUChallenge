//
//  APIClient.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation

public protocol APIClientProtocol {
    func fetchData<T: Decodable>(from url: URL?, completion: @escaping (Result<T, NetworkError>) -> Void)
}

public enum NetworkError: Error {
    case badURL
    case downloadError
    case decodeError(description: String?)
}

public final class APIClient: APIClientProtocol {

    private let session: URLSession
    private let decoder: JSONDecoder

    public init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }

    public func fetchData<T: Decodable>(from url: URL?, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = url else { return completion(.failure(.badURL)) }

        session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return completion(.failure(.downloadError))
            }

            do {
                let decodedData = try self.decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodeError(description: error.localizedDescription)))
            }

        }.resume()
    }

}
