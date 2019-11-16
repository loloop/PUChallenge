//
//  TripsService.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/15/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import Common

final class TripsService: OfferPageServiceProtocol {

    private let client: APIClientProtocol
    //swiftlint:disable:next line_length
    private let endpoint: URL? = URL(string: "https://gist.githubusercontent.com/insidegui/d2665b556f2be1b1ad3a19d2ef9bcc44/raw/afe1e0a9563e3bcddc3796b22becb8f12f82ee2e/viagens.json")

    init(client: APIClientProtocol? = nil) {
        if let client = client {
            self.client = client
        } else {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            self.client = APIClient(decoder: decoder)
        }
    }

    func fetchData(completion: @escaping (Result<BaseAPIModel<OfferPage>, NetworkError>) -> Void) {
        client.fetchData(from: endpoint, completion: completion)
    }

}
