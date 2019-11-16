//
//  APIClientMock.swift
//  PUChallengeTests
//
//  Created by Mauricio Cardozo on 11/16/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import Common

final class APIClientMock: APIClientProtocol {

    private(set) var didCallFetchData: Bool = false

    func fetchData<T>(from url: URL?, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
        didCallFetchData = true
        completion(.failure(.downloadError))
    }
}
